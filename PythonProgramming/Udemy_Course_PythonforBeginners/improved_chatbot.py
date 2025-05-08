from difflib import get_close_matches

def get_best_match(user_question: str, knowledge: dict) -> str | None:
    questions: list[str] = [q for q in knowledge]
    matches: list[str] = get_close_matches(user_question, questions, n=1, cutoff=0.6)

    if matches:
        return matches[0]

def run_chatbot(knowledge: dict) -> None:
    while True:
        user_input: str = input("You: ")

        best_match: str | None = get_best_match(user_input, knowledge)
        response: str | None = knowledge.get(best_match)

        if response:
            print(f"Bot: {response}")
        else:
            print(f"Bot: Sorry, I don't understand")

def main():
    brain: dict[str, str] = {"hello": "Hey there",
                             "How are you?": "I'm good thanks",
                             "What is the time?": "No clue",
                             "What can you do?": "I can answer your questions",
                             "Ok": "Great"
                             }
    run_chatbot(knowledge=brain)

main()