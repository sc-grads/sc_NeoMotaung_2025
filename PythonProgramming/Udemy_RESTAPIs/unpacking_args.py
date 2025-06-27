def multiply(*args):
    print(args)
    total = 1
    for arg in args:
        total *= arg
    return total

print(multiply(4,7,2))

#can be done with dictionaries as well
def add(x, y):
    return x + y

dict = {"x" : 12, "y" : 16}

print(add(**dict))