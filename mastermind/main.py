import clingo

import re
import sys
import random

SOLUTION_LENGTH=4
NUM_COLORS = 6

class DataOrganizer:
    def __init__(self, output):
        self.data = {}
        self.parse_data(output)
        
    def parse_data(self, output):
        # Use a regular expression to capture all terms like term(blah, blah, "blah")
        pattern = r'(\w+)\(([^)]+)\)'  # Captures terms like first_name("Anton"), location(top,1,"A"), etc.

        matches = re.findall(pattern, output)
        
        # Group the terms into a dictionary, storing the entire contents as a string
        for match in matches:
            term, values = match
            # Split the values by comma and remove unnecessary spaces or quotes
            values_list = [value.strip().strip('"') for value in values.split(',')]
            values_list = [(int(value) if value.isdigit() else value) for value in values_list]
            
            if term not in self.data:
                self.data[term] = []
            self.data[term].append(values_list)

    def print_by_type(self, type_name, index):
        """Print the list of items for a given type."""
        if type_name in self.data:
            items = self.data[type_name]
            if items:
                print(f"{type_name.capitalize()}s:")
                items = sorted(items, key=lambda x: x[index])

                for i in items:
                    print(f" - {i}")
            else:
                print(f"No {type_name} found.")
        else:
            print(f"Invalid type: {type_name}")

class Mastermind:
    def __init__(self):
        self.solution = []
        self.solutionLength = SOLUTION_LENGTH
        self.numColors = NUM_COLORS
        for i in range(0, self.solutionLength):
            self.solution.append(random.randint(1, self.numColors))
    def guess(self, guess):
        response = []
        for i in range(0, self.solutionLength):
            response.append(2 if guess[i]==self.solution[i] else 1 if guess[i] in self.solution else 0)
        return response

class Solver:
    def __init__(self):
        self.ctl = clingo.Control()
        path = 'mastermind\\model.lp'
        with open(path, 'r') as file:
            self.clingo_text = file.read()
        self.lastGuess = None

    def nextGuess(self, lastResponse):
        if lastResponse is None:
            self.lastGuess = [1,2,3,4]
            return self.lastGuess
        else:
            self.constrain(lastResponse)
            ctl = clingo.Control()
            ctl.add("base", [], self.clingo_text)
            ctl.ground([("base", [])])
            with ctl.solve(yield_=True, async_=True) as hnd:
                hnd.resume()
                _ = hnd.wait()
                model = hnd.model()
                if model is None:
                    print(f"no more models")
                    print(hnd.get())
                    return None
                self.lastGuess = self.parseAnswer(model)
                return self.lastGuess
    def constrain(self, lastResponse):
        predicates = ''
        for i in range(0, len(lastResponse)):
            color = str(self.lastGuess[i])
            index = str(i + 1)
            if lastResponse[i]==0:#no peg
                predicates += '\n:- guess(_, ' + color + ').'
                predicates += '\n:- possible_goal(_, ' + color + ').'
            elif lastResponse[i]==1:#white peg
                #1{guess(I, 3): index(I), I!=3}.
                #:- guess(3,3).
                predicates += '\n1{guess(I, '+color+'): index(I), I!='+index+'}.'
                predicates += '\n:- guess('+index+', ' + color + ').'
                predicates += '\n:- possible_goal('+index+', ' + color + ').'
            else:#black peg
                predicates += '\n:- not guess('+index+', ' + color + ').'
                predicates += '\n:- possible_goal('+index+', C), C!='+color+'.'
        self.clingo_text += predicates

    def parseAnswer(self, model):
        organizer = DataOrganizer(model.__str__())
        answerTerms = organizer.data['guess']
        answerDict = {}
        answer = []
        while len(answerTerms)>0:
            term = answerTerms.pop()
            answerDict[int(term[0])] = int(term[1])
        for i in range(1, SOLUTION_LENGTH+1):
            answer.append(answerDict[i])
        return answer
            
                
if __name__ == "__main__":
    game = Mastermind()
    solver = Solver()
    guess = solver.nextGuess(None)    
    print('solution:', game.solution)
    maxGuess = 20
    guessNumber = 1
    while guessNumber < maxGuess:
        print('guess #', guessNumber, ':', guess)
        response = game.guess(guess)
        #print('response:', response)
        allBlack = True
        for i in range(0, len(response)):
            if response[i]!=2:
                allBlack = False
        if allBlack:
            break
        guess = solver.nextGuess(response)
        guessNumber += 1
