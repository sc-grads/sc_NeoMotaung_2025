import time
import sys
import random

moves = {"rock" : "🪨", "paper" : "📜", "scissors" : "✂️"}
valid_moves: list[str] = list(moves.keys())

print("==============================================================")
print("LET'S PLAY ROCK PAPER SCISSORS")
while True:
    print("==============================================================")
    print("")
    player_input = input("Enter your move (rock/paper/scissors), exit to quit: ").lower()

    if player_input == "quit":
        print("Thank you for playing, enjoy your day")
        sys.exit()
    elif player_input not in valid_moves:
        print("Enter valid input")
        continue

    ai_move = random.choice(valid_moves)

    print(f"You chose: {moves[player_input]}")
    print(f"CPU chose: {moves[ai_move]}")

    if player_input == ai_move:
        print("It's a tie")
    elif player_input == "rock" and ai_move == "scissors":
        print("You won")
    elif player_input == "paper" and ai_move == "rock":
        print("You won")
    elif player_input == "scissors" and ai_move == "paper":
        print("You won")
    else:
        print("The bot beat you")

    print("")
    print("==============================================================")