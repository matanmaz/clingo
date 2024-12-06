import clingo

import re

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
            
            if term not in self.data:
                self.data[term] = []
            self.data[term].append(values_list)

    def print_by_type(self, type_name):
        """Print the list of items for a given type."""
        if type_name in self.data:
            items = self.data[type_name]
            if items:
                print(f"{type_name.capitalize()}s:")
                for item in items:
                    print(f" - {item}")
            else:
                print(f"No {type_name} found.")
        else:
            print(f"Invalid type: {type_name}")
    
    def print(self):
        lines = {}
        for name in self.data['full_name']:
            first_name = name[0]
            last_name = name[1]
            for fc in self.data['fc']:
                if fc[0] == first_name:
                  camp = fc[1]
            for fl in self.data['fl']:
                if fl[0] == first_name:
                  location = fl[1]
            lines[location]=[first_name, last_name, camp, location]
        for key in sorted(lines):
            print(lines[key])
class Context:
  def first_letter(self, word):
    return clingo.String(word.string[0])

def on_model(m):
  organizer = DataOrganizer(m.__str__())
  # Print items by type
  organizer.print()


ctl = clingo.Control()
with open(r'C:\Users\mazurskm\clingo\big_5_game_rangers.lp', 'r') as file:
    clingo_file_text = file.read()

ctl.add("base", [], clingo_file_text)
ctl.ground([("base", [])], context=Context())
ctl.solve(on_model=on_model)
import json
print(json.dumps(ctl.statistics, sort_keys=True, indent=4, separators=(',', ': ')))

