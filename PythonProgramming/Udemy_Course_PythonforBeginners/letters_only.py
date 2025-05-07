import string

def is_letters_only(text: str) -> None:
    alphabet: str = string.ascii_letters + " "

    for char in text:
        if char not in alphabet:
            raise ValueError("Text can only contain letters from the alphabet")

    print(f"'{text}' is letters-only, good")


def main() -> None:
    while True:
        try:
            userinput = input("Check text: ")
            is_letters_only(userinput)
        except ValueError:
            print("Only English letters please")
        except Exception as e:
            print(f"Encountered an unknown exception: {type(e)} {e}")

main()