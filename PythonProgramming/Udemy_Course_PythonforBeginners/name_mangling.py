class Car:
    __YEAR: int = 2000

    def __init__(self, brand: str, fuel_type: str):
        self.__brand = brand
        self.__fuel_type = fuel_type

        self.var: str = "red"

    def drive(self):
        print(f"Driving: {self.__brand}")

    def __get_description(self):
        print(f"{self.__brand}: {self.__fuel_type}")

    def display_colour(self):
        print(f"{self.__brand} is {self.var.capitalize()}")

class Toyota(Car):
    def __init__(self, brand: str, fuel_type: str):
        super().__init__(brand, fuel_type)
        self.var = 100

def main():
    car: Car = Car("BMW", "Diesel")
    car.drive()

    toyota: Toyota = Toyota

    print(car._Car__brand)
    car._Car__get_description()

main()