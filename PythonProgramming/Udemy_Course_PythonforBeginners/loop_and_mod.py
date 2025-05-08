people: list[str] = ["Anna", "Bob", "Chris", "David", "Fred"]
new_people: list[str] = []

for person in people:
    print(f"- {person}, {people.index(person)}")

    if person == "Bob":
        print(f"Removing: {person}")
        #people.remove("Bob")
        continue

    new_people.append(person)

print(new_people)