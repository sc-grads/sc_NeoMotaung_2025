wifi_enabled: bool = True
has_power: bool = True
has_subscription: bool = True

requirements: list[bool] = [wifi_enabled, has_power, has_subscription]

if wifi_enabled and has_subscription and has_power:
    #print("Connected to the internet")
    ...

if all(requirements):
    #print("Connected to the interwebs")
    ...

people_voted: list[int] = [1,1,1,1,1,1,1,1,1]

if all(people_voted):
    print("Everyone voted")
else:
    print("Not everyone has voted")