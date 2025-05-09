code = """
x = 10
y = 20

print(x + y)
print("Hello, world")

for i in range(3):
    print(i)
"""
while True:
    user_input = input("Command: ")
    exec(user_input)