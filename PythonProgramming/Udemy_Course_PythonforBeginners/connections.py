import time

def connect() -> None:
    print("Connecting to the internet...")
    time.sleep(2)
    print("Connected")

#testing purposes
#Checks whether a call to connect is ran in another file or this file
#If name of file is the main file here then this call directly below runs
#If it is called elsewhere then the call below will not run
#As the name of the file is not the same as the main one here
if __name__ == "__main__":
    connect()