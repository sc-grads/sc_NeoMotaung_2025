#dont use list comps for this

"""numbers = [1,10,5,3]
sorted_numbers = sorted(numbers)
print(sorted_numbers)

people = ["Mario", "James", "Anna"]
sorted_people = sorted(people, key=lambda x: len(x))
print(sorted_people)
#A has ASCII value of 65, a has ASCII value of 97"""

class Animal:
    def __init__(self, name, weight):
        self.name = name
        self.weight = weight

    def __repr__(self):
        return f"{self.name} = {self.weight} kg"

cat = Animal("Cat", 10)
dog = Animal("Dog", 5)
kangaroo = Animal("Kangaroo", 50)

sorted_animals = sorted([cat, dog, kangaroo], key=lambda animal: animal.weight)
print(sorted_animals)