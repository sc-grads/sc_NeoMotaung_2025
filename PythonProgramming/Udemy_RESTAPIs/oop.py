class Student:
    def __init__(self, name, grades):
        self.name = name
        self.grades = grades
    
    def average(self):
        return sum(self.grades) / len(self.grades)
    
student = Student("Neo", (45,76,2,27,97))
print(student.name)
print(student.average())