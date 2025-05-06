def greet(name, language, default = "Hello"):

    if language == "It":
        print(f"Ciao, {name}")
    else:
        print(f"{default}, {name}")


greet("Mario", language= "Xhosa")