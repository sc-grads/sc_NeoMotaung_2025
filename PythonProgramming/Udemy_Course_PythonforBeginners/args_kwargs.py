def add(*args: int) -> int:
    print(args)
    return sum(args)

def greeting(greet: str, *people: str, ending: str) -> None:
    for person in people:
        print(f"{greet}, {person}{ending}")

def func(*args: str, **kwargs: int):
    print(args)
    print(kwargs)

#print(add(1,2,3,5,5,2))
#greeting("Hello", "Bob", "James", "Lee", "Don", ending= "?")
func("a", "b", a=1, b=2)