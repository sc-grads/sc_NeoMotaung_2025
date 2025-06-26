#Magic number game:

number = 7
user_guess = (input("Do you want to play a game? Enter 'y' to enter: "))

if(user_guess in ("y", "Y")):
    # not good practise, just shows the utility of in
    # Would have been better to use .lower()
    user_number = int(input("Guess a number: "))
    if(user_number == number):
        print("You guessed right")
    elif(user_number - number in (-1, 1)):
        #Checks that the difference is equal to one
        # not good practise, just shows the utility of in
        # Would have been better to use absolute
        print("You were off by one")
    else:
        print("You were wrong")