def get_length(text) -> int:
    print(f"Getting the length of: {text}")
    return len(text)

name = input("Enter your name: ")
print(get_length(name))