class Animals:

    #defined as a class attribute not self


    def __init__(self, name: str):
        self.name = name
        self.tricks: list[str] = []

    def teach_trick(self, trick_name: str):
        self.tricks.append(trick_name)

def main() -> None:
    cat: Animals = Animals("Cat")
    cat.teach_trick("Wash dishes")
    cat.teach_trick("Do backflips")

    dog: Animals = Animals("Dog")
    dog.teach_trick("Do finances")
    dog.teach_trick("Investing")

    print(f"Cat tricks: {cat.tricks}")
    print(f"Dog tricks: {dog.tricks}")

    #Dog tricks are still added to cat tricks because
    # tricks is defined as a class attribute not self.

if __name__ == '__main__':
    main()