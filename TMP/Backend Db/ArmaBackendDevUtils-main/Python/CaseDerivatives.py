from itertools import product
import sys

def randString(istr):
    list_ = [(c, c.upper()) if not c.isdigit() else (c,) for c in istr.lower()]
    return ["".join(item) for item in product(*list_)]

print(randString(sys.argv[1]))
    
