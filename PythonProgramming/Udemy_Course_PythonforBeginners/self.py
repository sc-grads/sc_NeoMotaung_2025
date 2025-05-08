#self defines the current instance of a class

class Fruit:
    def __init__(self, name: str, grams: float) -> None:
        self.name = name
        self.grams = grams

    def eat(self) -> None:
        print(f"Eating {self.grams}g of {self.name}")

def main() -> None:

    #Right now self = apple
    apple: Fruit = Fruit("Apple", 25)
    print(apple.name)

    #Right now self = banana
    banana: Fruit = Fruit("Banana", 10)
    print(banana.name)
    banana.eat()
    apple.eat()

main()