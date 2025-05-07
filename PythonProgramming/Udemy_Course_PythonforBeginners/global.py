number: int = 10

def change_number() -> None:
    global number
    number = 5

print(number)
change_number()
print(number)