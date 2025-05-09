var = 10

def add(a, b):
    return a + b

print(f"{add(5, 10) = }")

fraction = 1234.5677
print(f"{fraction:.2f}")

var = "BOB"
print(f"{var:.>10}: Hello")

numbers = [1, 100, 1000, 10000]
for number in numbers:
    print(f"{number:_>5}: counting")

path = r"\Users\Neo\Documents"
print(path)