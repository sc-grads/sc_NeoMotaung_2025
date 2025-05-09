numbers = [1,2,3,4,5]

def double(number):
    return number * 2

"""doubled = map(lambda n: n * 2, numbers)
print(doubled)
print(list(doubled)"""

numbers = [1,2,3,4,5]
letters = ["a", "b", "c"]

def combine_elements(n, l) -> tuple[int, str]:
    return n, l

combined = map(combine_elements, numbers, letters)
print(list(combined))



