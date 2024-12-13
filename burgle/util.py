import os
import clingo

os.system(r'cd C:\Users\mazurskm\clingo\burgle & C:\Users\mazurskm\AppData\Local\anaconda3\python.exe C:\Users\mazurskm\clingo\wrapper.py main.lp')

class Context:
  def minimum_float(self, *values):
    return clingo.String(values[0])