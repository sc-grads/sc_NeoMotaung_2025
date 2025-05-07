#Booleans are obvious truthy values but any type can be truthy or falsy values

#When a container is empty it results to false, if it has a value it is true
print(bool([]))
print(bool([1,2]))

dict = {}
print(bool(dict))

dict = {1: "Mario"}
print(bool(dict))

pairs = {1: "Mario", 2: "Luigi"}

if pairs:
    for k,v in pairs.items():
        print(k, v, sep=": ")
else:
    print("No data found")