class Animal:
    def __init__(self, name: str):
        self.name = name

    def drink(self):
        print(f"{self.name} is drinking")

    def eat(self):
        print(f"{self.name} is eating")

#Dog inherits Animal
class Dog(Animal):
    def __init__(self, name: str):
        super().__init__(name)

    def bark(self):
        print(f"{self.name}: bark bark")

    def routine(self):
        self.eat()
        self.bark()
        self.drink()

class Cat(Animal):
    def __init__(self, name: str):
        super().__init__(name)

    def meow(self):
        print(f"{self.name}: meow meow")

def main():
    dog: Dog = Dog("Max")
    cat: Cat = Cat("Snow")

    dog.bark()
    cat.meow()

    dog.eat()
    cat.meow()

main()