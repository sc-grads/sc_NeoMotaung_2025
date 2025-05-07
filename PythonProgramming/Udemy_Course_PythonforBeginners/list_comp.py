numbers: list[int] = [1,2,3]

#Append the double of a value to double_lc for each value in numbers
doubled_lc: list[int] = [number * 2 for number in numbers]
#print(doubled_lc)

names: list[str] = ["Mario", "James", "Luigi", "John"]
j_names: list[str] = []

for name in names:
    if name.startswith("J"):
        j_names.append(name)

#print(j_names)

#Append name to j_names_lc for each name in names if name starts with a J
j_names_lc: list[str] = [name for name in names if name.startswith("J")]
#print(j_names_lc)

numbers = [1,2,3,4,5,6,7,8,9,10]
even_numbers: list[int] = [number for number in numbers if number % 2 == 0]
print(even_numbers)
