from dataclasses import dataclass, field

@dataclass
class Fruit:
    name: str
    grams: float
    price_per_kg: float
    total_price: float = field(init=False)

    def __post_init__(self):
        self.total_price = (self.grams / 100) * self.price_per_kg

    def describe(self):
        print(f"{self.grams}g of {self.name} costs ${self.total_price}")

def main():
    apple = Fruit("Apple", 1500, 5)
    orange = Fruit("Orange", 2500, 10)

    apple.price_per_kg = 100

    print(apple)
    print(orange)

if __name__ == '__main__':
    main()
