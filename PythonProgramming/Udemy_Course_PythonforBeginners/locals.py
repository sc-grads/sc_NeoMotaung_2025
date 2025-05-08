#print(locals())

EXAMPLE = "Yo"

def add(a: int, b: int):
    result: int = a + b
    print(f"{a} + {b} = {result}")

    print("add() has these locals: ", locals())
    print("add() has these locals: ", globals())
    print(EXAMPLE)

add(1,4)