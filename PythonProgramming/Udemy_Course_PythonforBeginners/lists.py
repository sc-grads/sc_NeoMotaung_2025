#Lists can have elements that are of a different data type to one another
random_list = [1, "Hello", True, [1,2,3]]
#print(random_list)

names: list[str] = ["James", "John", "Lee"] #List of len 3, elements are from 0 to len - 1: 0-2

#print(names[0]) #James
#print(names[2]) #Lee

#Append

names.append("Mark")
print(names)

#Remove

names.remove("John")
print(names)

#Pop

names.pop()
print(names)

#Modify

names[0] = "Charles"
print(names)

#Insert

names.insert(1, "Tim")
print(names)

#Clear

names.clear()
print(names)

