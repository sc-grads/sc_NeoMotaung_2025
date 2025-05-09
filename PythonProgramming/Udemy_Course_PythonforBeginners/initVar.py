from dataclasses import dataclass, field, InitVar

from charset_normalizer.utils import is_unicode_range_secondary


@dataclass
class Fruit:
    name: str
    grams: float
    price_per_kg: float
    is_rare: InitVar[bool | None] = None
    total_price: float = field(init=False)

    def __post_init__(self, is_rare: bool | None):
        if is_rare:
            self.price_per_kg *= 2

        self.total_price = (self.grams / 100) * self.price_per_kg

    def describe(self):
        print(f"{self.grams}g of {self.name} costs ${self.total_price}")

def main():
    apple = Fruit("Apple", 1500, 5)
    orange = Fruit("Orange", 2500, 10)
    passion = Fruit("Passion", 100, 50, is_rare=True)

    apple.describe()
    orange.describe()
    passion.describe()

if __name__ == '__main__':
    main()