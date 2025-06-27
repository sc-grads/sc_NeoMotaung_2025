from mimetypes import inited
from typing import List, Optional

class Student:
    def __init__(self, name, grades: List[int] = []): #bad
        self.name = name
        self.grades = grades

    def take_exam(self, result: int):
        self.grades.append(result)

bob = Student("Bob")
rolf = Student("Rolf")
bob.take_exam(90)
print(bob.grades)
print(rolf.grades)