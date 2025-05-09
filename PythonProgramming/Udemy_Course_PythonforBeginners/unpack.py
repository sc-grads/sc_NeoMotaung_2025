a, b, c = [4,6,10]

a, *b = "abcdefg"

#print(a, b)

def add(a, b):
    #print(f"{a+b = }")
    ...

#numbers = {"a": 5, "b": 10}
#add(**numbers)

numbers = [1,2,3,4,5]
params: dict[str, str] = {"sep": "-", "end": "."}
print(*numbers, **params)