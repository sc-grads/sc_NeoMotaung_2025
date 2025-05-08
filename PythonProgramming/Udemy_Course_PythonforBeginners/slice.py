text: str = "Hello, World"

first_three: slice = slice(0,3)

print(text[first_three])

reverse_slice: slice = slice(None, None, -1)

print(text[reverse_slice])

step_two: slice = slice(None, None, 2)

print(text[step_two])