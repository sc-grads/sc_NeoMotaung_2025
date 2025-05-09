from dataclasses import dataclass, field

@dataclass

class Fruit:
    name: str
    grams: float
    price_per_kg: float
    edible: bool = True
    related_fruits: list[str] = field(default_factory=list)

def main():
    apple = Fruit("Apple", 100, 4)
    pear = Fruit("Pear", 250, 10, related_fruits=["Apple", "Orange"])
    print(apple)
    print(pear)
    print(pear.related_fruits)


main()