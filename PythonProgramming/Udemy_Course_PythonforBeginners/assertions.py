def start_program(db):
    assert db, "Database is empty" #truthy

    print("Loaded:", db)
    print("Program started successfully")

def main():
    var = -1
    assert var > 0, f"{var} is less than 0"

main()