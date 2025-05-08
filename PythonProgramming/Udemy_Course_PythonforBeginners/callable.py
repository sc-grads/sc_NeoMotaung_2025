fruit: str = "apple"
number: int = 10

def func():
    print("func() was called")

print(f"callable(): {callable(fruit)}")
print(f"callable(): {callable(print)}")
