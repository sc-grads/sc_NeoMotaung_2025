from dataclasses import dataclass, field
from uuid import uuid4, UUID

from else_finally import user_input


@dataclass
class Note:
    id: UUID = field(init=False)
    title: str
    body: str

    def __post_init__(self):
        self.id = uuid4()

class NoteApp:
    def __init__(self, author: str, notes: list[Note] | None = None):
        self.author = author

        if notes is None:
            self._notes = []
        else:
            self._notes = notes

        self.display_instructions()

    @staticmethod
    def display_instructions():
        print("Welcome to notes")
        print("Here are the comments: ")
        print("1 - Add new note")
        print("2 - Edit note")
        print("3 - Delete note")
        print("4 - Display all notes")

    def _add_note(self):
        title = input("Title: ")
        body = input("Body: ")

        note = Note(title, body)
        self._notes.append(note)
        print("Note was added")

    def _edit_note(self):
        print("Which note would you like to edit")
        self._show_notes()

        try:
            note_index = int(input("Index: ")) - 1
            current: Note = self._notes[note_index]

            new_title = input("New title: ")
            new_body = input("New body: ")

            current.title = new_title
            current.body = new_body
            print("Note was updated")
        except IndexError:
            print("Select valid note index")
            self._edit_note()
        except ValueError:
            print("index cant be empty")

    def _delete_note(self):
        print("Which note would you like to delete: ")
        self._show_notes()

        try:
            note_index = int(input("Index: ")) - 1
            print("Note was deleted")
        except IndexError:
            print("Select valid note index")
            self._edit_note()
        except ValueError:
            print("index cant be empty")
            print("Aborting operation")

    def _show_notes(self):
        if not self._notes:
            print("no notes")
            return

        for i, note in enumerate(self._notes, start=1):
            print(f"[{i}] {note.title}: {note.body}")

    def _select_option(self, user_input:str):
        if user_input not in ["1","2","3","4"]:
            print("Please choose valid response")
            return

        if user_input == "1":
            self._add_note()
        elif user_input == "2":
            self._edit_note()
        elif user_input == "3":
            self._delete_note()
        elif user_input == "4":
            self._show_notes()

    def run_app(self):
        while True:
            user_input = input("You: ")
            self._select_option(user_input)






def main():
    sample_notes = [Note(title="Title1", body="Hello there bob"),
                    Note(title="Title2", body="More text")]

    note_app = NoteApp(author="Bob", notes=sample_notes)
    note_app.run_app()

main()