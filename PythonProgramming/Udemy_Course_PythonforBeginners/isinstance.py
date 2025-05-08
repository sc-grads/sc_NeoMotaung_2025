number: int = 10
pi: float = 3.14
text: str = "banana"
my_list: list[int] = [1,2,3]

#print(isinstance(number, int))
#print(isinstance(number, str))
#print(isinstance(pi, int))
#print(isinstance(pi, float))

#print(isinstance(pi, float | int))

class Animal:
    pass

class Cat(Animal):
    pass

print(isinstance(Cat(), Animal))
print(isinstance(Animal(), Cat))

