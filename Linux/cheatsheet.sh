#!/bin/bash

ls #Lists files and directorues in the current lcoation
ls -a #displays files and direcotries including hidden ones
ls -l #Shows all direcotries and files including additional details including permissions and creation time
ls --color #Displays files and direcotry with a colour code, ie direcotiries will be shown in a different colour from files
ls -r #Display in reverse order
ls -R #Display recursively

cd [directory] #Changes to a specified directory, cd stands for Change Driectory
#eg
cd etc
cd .. #Go to parent directory

pwd #Prints the current working directory

mkdir [directory] #Stands for Make directory, creates a new directory
#eg
mkdir Desktop

rmdir [directory] #Stands for remove directory, deletes directory
#eg
rmdir Desktop

rm [file] #Deletes file
#eg
rm textfile.txt

rm -r [directory] #Removes a directory and its contents, defined as a Recursive deletion. Cannot be reversed
#eg
rm -r Desktop

cat [file] #Displays the contents of a file
cat textfile.txt

less [file] #Opens a file for viewing page by page
less textfile.txt

more [file] #Similar to less but only moves forward
more textfile.txt

head -n [number] [file] #Shows the first n number of lines in a file.
head -n  textfile.txt

tail -n [number] [file] #Shows the last n number of lines in a file.
tail -n 5 textfile.txt

chmod [mode] [file] #Changes file permissions
chmod 666 textfile.txt

ls -l # Displays detailed file permissions and ownerships

clear #clears cli

exit #logs out of the session

tree #displays directory in a tree-like structure

man [command] #opens manual of command, showing it's information and uses. Press Q to quit.
#eg
man ls

nano [file] #Opens file and displays its content, editting the file is possible
#eg
nano textfile.txt

history #Displays session history commands

#Use tags such as --help and --version to get additional info on a particular tag, application etc.

[command] --help 
#eg
ls --help

[command] --version
#eg
ls --version
