list = ["bob","Neo", "Kane"]
tuple = ("bob","Neo", "Kane")
set = {"bob","Neo", "Kane"}

#Can access elements of lists and tuples using subscript notation but not sets
#sets have no order so accessing elements this way makes no sense
'''print(list[1])
print(tuple[1])'''
#print(set[1])

#We can re-assign elements of lists directly but we cannot do so with tuples
#Since sets are not subscriptable we can't do it for them either
list[1] = "Owen"
print(list)
#tuple[1] = "Owen"
#print(tuple)

#We can add elements to lists and sets
#Since tuple cannot be modified, we can't add elements
list.append("John")
print(list)
set.add("John")
print(set)

#add() differs from append() as sets do not have any order, so the element is simply inserted at a random
#position
#sets cannot have repeated elements so redundant adds are simply ignored
set_two = {"James", "Jack", "John"}
set_two.add("Dylan")
set_two.add("Dylan")
print(set_two)