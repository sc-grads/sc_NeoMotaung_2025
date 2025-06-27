class Person:
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return "Hello"
        

pers = Person("Bob")
print(pers)