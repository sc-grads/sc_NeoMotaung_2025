from abc import ABC, abstractmethod

class Appliance(ABC):
    def __init__(self, brand: str, version_no: int):
        self.brand  = brand
        self.version_no = version_no
        self.is_turned_on: bool = False

    @abstractmethod
    def turn_on(self):
        ...

    @abstractmethod
    def turn_off(self):
        ...

class Lamp(Appliance):
    def __init__(self, brand: str, version_no: int):
        super().__init__(brand, version_no)

    def turn_on(self):
        if self.is_turned_on:
            print(f"{self.brand} is already turned on")
        else:
            self.is_turned_on = True
            print(f"{self.brand} is now turned on")

    def turn_off(self):
        if self.is_turned_on:
            self.is_turned_on = False
            print(f"{self.brand} is now turned off")
        else:
            print(f"{self.brand} is already turned off")

class Oven(Appliance):
    def __init__(self, brand: str, version_no: int):
        super().__init__(brand, version_no)

    def turn_on(self):
        raise NotImplementedError("Need to add function for turn_on")

    def turn_off(self):
        raise NotImplementedError("Need to add function for turn off")



def main():
    lamp: Lamp = Lamp("Z-Lite", 1)
    lamp.turn_on()

    oven: Oven = Oven("z-cook", 2)
    oven.turn_on()

main()

