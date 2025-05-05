name = input("Enter a name: ")
noun_a = input("Enter a noun: ")
verb_a = input("Enter a verb: ")
noun_b = input("Enter a noun: ")
verb_b = input("Enter a verb (past tense): ")
number_a = input("Enter a number: ")
number_b = input("Enter another number: ")

story = f"""
====================================================================
This is a story about {name}, a strong and beautiful {noun_a} who 
loved to {verb_a}. 

{name} once {verb_b} and won a {noun_b} as a prize.
Isn't that incredible?

Today, {name} is {int(number_a) + int(number_b)} years old and has 
retired from all adventures.

But the story will live on forever
====================================================================
"""

print(story)