class Connection:
    def __init__(self, connection_type: str) -> None:
        self.connection_type = connection_type

    #method
    def connect(self) -> None:
        print(f"Connecting to: {self.connection_type}")

#function
def connect(connection_type: str) -> None:
    print(f"Connecting to: {connection_type}")

#all methods are functions but not functions are methods.