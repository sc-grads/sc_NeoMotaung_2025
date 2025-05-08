from typing import Self

class Car:
    LIMITER: int = 200

    def __init__(self, brand: str, max_speed: int):
        self.brand = brand
        self.max_speed = max_speed

    @classmethod
    def change_limit(cls, new_limit: int):
        cls.LIMITER = new_limit

    def display_info(self):
        print(f"{self.brand} (max = {self.max_speed}, limiter = {self.LIMITER})")

def main():
    bmw: Car = Car("BMW", 240)
    toyota: Car = Car("Toyota", 190)

    toyota.change_limit(150)

    bmw.display_info()
    toyota.display_info()

if __name__ == "__main__":
    main()