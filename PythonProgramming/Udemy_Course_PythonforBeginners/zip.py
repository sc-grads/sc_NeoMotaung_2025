numbers = [1,2,3,4]
letters = ["A", "B", "C", "D"]
symbols = ["!", "%", "*", "("]

zipped = zip(numbers, symbols, letters, strict=True)
print(zipped)
print(list(zipped))