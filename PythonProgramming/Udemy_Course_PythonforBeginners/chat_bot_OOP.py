from random import choice
from datetime import datetime

from chat_bot import user_input


class ChatBot:
    def __init__(self, name:str, age:int) -> None:
        self.name = name
        self.age = age

    def get_description(self) -> str:
        return f"{self.name} is a bot who is {self.age} years old"

    def get_response(self, text: str) -> str:
        lowered: str = text.lower()

        if "hello" in lowered:
            return f"{self.name}: Hello there"
        elif "bye" in lowered:
            return f"{self.name}: Bye Bye"
        elif "how old are you" in lowered:
            return f"{self.name}: I am {self.age} years old"
        elif "what time is it" in lowered:
            now: datetime = datetime.now()
            return f"{self.name}: The current time is {now:%H:%M:%S}"
        elif "how are you" in lowered:
            return f"{self.name}: Great, thanks"
        else:
            random_responses: list[str] = ["I dont understand", "Would you mind rephrasing?", "What?"]
            return f"s{self.name}: {choice(random_responses)}"

    def run(self) -> None:
        while True:
            user_input: str = input("You: ")
            if user_input == "exit":
                print(f"Thank you for chatting with {self.name}")
                break

            response: str = self.get_response(user_input)
            print(response)

def main() -> None:
    mario: ChatBot = ChatBot("Mario", 27)

main()