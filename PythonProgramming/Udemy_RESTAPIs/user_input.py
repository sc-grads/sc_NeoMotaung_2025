#Get user input with input()
'''name = input("Hello what's your name?: ")
print(name)

#For numerical values, we must cast the input() return value
num = int(input("Enter a number: "))
print(num)'''

square_feet = int(input("How big is your house: "))
square_meter = square_feet / 10.8 #int to float
print(f"Your house is {square_feet} square feet which is {square_meter:.2f} m2 ")
#:.2f is formatting for 2 decimal places