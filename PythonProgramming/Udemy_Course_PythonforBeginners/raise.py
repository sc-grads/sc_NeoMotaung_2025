def check_age(age) -> bool:
    if age < 0:
        raise ValueError("Not valid age")
    elif age >= 21:
        print("Youre old enough")
        return True
    else:
        print("Youre too young")
        return False

old = check_age(-10)