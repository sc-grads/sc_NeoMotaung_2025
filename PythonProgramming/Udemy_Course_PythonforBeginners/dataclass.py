from dataclasses import dataclass

@dataclass
class Coin:
    name: str
    value: float
    id: str

def main():
    bitcoin = Coin("Bitcoin", 10000, "BTC")
    bitcoin2 = Coin("Bitcoin", 10000, "XRP")
    ripple = Coin("ripple", 200, "XRP")

    print(bitcoin)
    print(ripple)

    print(bitcoin == ripple)
    print(bitcoin == bitcoin2)

if __name__ == '__main__':
    main()