elements = {1: "John", 2 : "James"}
dict = {"John": 22, "James" : 32}

print(elements[1])
print(dict["James"])

#Add elements
elements[3] = "Nolan"
dict["Luke"] = 53

print(elements)
print(dict)

elements[2] = "Duke"
print(elements)

elements.pop(2)
dict.pop("John")

print(elements)
print(dict)

elements.clear()
print(elements)

