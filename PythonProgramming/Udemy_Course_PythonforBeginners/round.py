a: float = 200.020302
b: float = 18.23421
c: float = 38.2920113344

result: float = a + b + c
rounded: float = round(result, 2)
print(round(result, 3))
print(round(result, 2))
print(round(result, 1))
print(round(result, 0))
print(round(result, -1))
print(round(result, -2))

