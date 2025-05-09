class User:

    """"
    Base class for creating users
    """

    def __init__(self, user_id):
        self.user_id = user_id

    def show_id(self):
        """prints the user_id"""

def user_exists(user, database):
    """
    Checks if a user is inside a database

    :param user: the user to check for
    :param database: the database to check inside
    :return: bool
    """

def main():
    bob = User(1)
    user.show_id()

    anna = User(2)
    database = {bob, anna}

    if user_exists(bob, database):
        print("user found")
    else:
        print("user not found")

main()