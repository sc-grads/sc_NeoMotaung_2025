class Person:
    def __init__(self, name: str, age: int) -> None:
        self.name = name
        self.age = age

    #easy to read for users
    def __str__(self) -> str:
        return f"{self.name}: {self.age} years old"

    #for developer, helps them understand what the class actually is
    def __repr__(self) -> str:
        return f"Person (name = {self.name}, age = {self.age})"

def main() -> None:
    mario: Person = Person("Mario", 22)
    print(mario)
    print(repr(mario))

if __name__ == "__main__":
    main()