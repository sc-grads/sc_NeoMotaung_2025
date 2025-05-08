while True:
    try:
        user_input = input("Enter a number: ")
        print(f"10 / {user_input} = {10 / float(user_input)}")
    except ZeroDivisionError:
        print("You cant divide by 0")
    except ValueError:
        print("Please enter a number")

#Exception is broad and covers every different type of error