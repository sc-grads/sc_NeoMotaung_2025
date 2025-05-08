

while True:
    try:
        num = float(input("Enter number: "))
        print(f"Number: {num}")
    except Exception as e:
        print(type(e))
        print(e)

