class Calculator:
     def __init__(self, version: int) -> None:
         self.version = version

     @staticmethod
     def add(*numbers: float):
         return sum(numbers)


def main():
    calc: Calculator = Calculator(version=1)
    result: float = calc.add(1,2,3,4)
    print(result)

main()
