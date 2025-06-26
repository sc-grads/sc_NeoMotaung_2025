#F string embed variales into strings
name = "Bob"
greeting = f"Hello {name}"
print(greeting)

#f strings aren't dynamic though (re-assigning name will still show bob in greeting)
name = "Adam"
print(greeting)

#format() defines a template for strings that allow us to embed values into strings
greeting = "Hello {} and {}, my name is {}"
greeting_with_name = greeting.format("Bob", "Duncan", "Billy")
print(greeting_with_name)