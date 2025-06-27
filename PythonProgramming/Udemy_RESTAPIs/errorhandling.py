def divide(divident, divisor):
    if divisor == 0:
        raise ZeroDivisionError("Divisor cannot be 0")

grades = []

print("Welcome, get average grade")
try:
    average = divide(sum(grades), len(grades))
except ZeroDivisionError as e:
    print("There are no grades yet found")
else:
    print(f"The average grafe is {average}")
finally:
    print("Thank you")