class Connection:
    def __init__(self, connection_type: str, cost: float) -> None:
        print(f"{connection_type} connection established! (Cost: {cost})")
        self.connection_type = connection_type
        self.cost = cost

    def close_connection(self) -> None:
        print(f"Closing {self.connection_type} connection... ")

    #Double underscore is called a dunder method

def main() -> None:
    internet: Connection = Connection("Internet", 2)
    satellite: Connection = Connection("Satellite", 20)

    internet.close_connection()
    satellite.close_connection()

if __name__ == "__main__":
    main()