user_input = "0"

try:
    result = 1/ float(user_input)
    print(f"1/{user_input} = {result}")
except ValueError:
    print("Wrong type")
except ZeroDivisionError:
    print("Cant divide by 0")
else:
    print("There were no exceptions")
finally:
    print("I am finally executed")