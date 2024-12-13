import clingo

import re
import sys
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


def on_model(m):

  organizer = DataOrganizer(m.__str__())
  # Print items by type
  terms = []
  indeces = []
  if len(sys.argv) > 2:
    for arg in sys.argv[2:]:
        if arg.isdigit():  # Check if the argument is a number
            indeces.append(int(arg))
        else:
            terms.append(arg)
  else:
      terms = ['result']
      indeces = [0]
  terms_dict = dict(zip(terms, indeces))
  for term in terms_dict:
      organizer.print_by_type(term, terms_dict[term])
  


ctl = clingo.Control(["0"])
path = sys.argv[1]
with open(path, 'r') as file:
    clingo_file_text = file.read()

ctl.add("base", [], clingo_file_text)
ctl.ground([("base", [])], context=Context())
max_models = 10
with ctl.solve(yield_=True, async_=True) as hnd:
    while max_models>0:
        hnd.resume()
        _ = hnd.wait()
        m = hnd.model()
        if m is None:
            print(f"no more models")
            print(hnd.get())
            break
        print(f"optimal:",m.optimality_proven,"cost",m.cost)
        on_model(m)
        max_models = max_models - 1
        if m.optimality_proven:
            print(f"optimal found")
            break