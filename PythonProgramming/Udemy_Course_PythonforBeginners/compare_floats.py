from math import isclose

#print(0.2 + 0.1 == 0.3)
#print(f"0.2 + 0.1 == {0.2 + 0.1}")

a: float = 99.5
b: float = 100.0


print(f"{a} == {b}?", isclose(a,b, abs_tol = 0.002))

# abs_tol is absolute tolerance
# absolute tol doesnt scale with our numbers
# rel_tol scales with our numbers based on the percentage, 1% = 0.001

print(f"{a} == {b}?", isclose(a,b, rel_tol = 0.01))