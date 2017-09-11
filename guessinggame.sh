#!/usr/bin/env bash
# simple game which prompts user to guess the number of files in the current directory.
# no command-line args, user prompted within shell script.

NumberOfFiles=$(ls | wc -l)    # use word count in line format to determine number of files in current directory.
GuessIsTrue=1   # initialize GuessIsTrue to 1 to indicate it's FALSE

function WelcomeMessage() {
printf "Welcome! Try to guess how many files are in the current directory!  Ready?\n"
printf "Type in your first guess, and press ENTER.\n"
read UsersGuess
}

function ProcessInput() {
while [[ ${GuessIsTrue} != 0 ]]
do
if [[ ${UsersGuess} -lt ${NumberOfFiles} ]];
then
	printf "Too low! Type a higher number!\n"
	GuessIsTrue=1
	read UsersGuess
elif [[ ${UsersGuess} -gt ${NumberOfFiles} ]];
then
	printf "Too high! Type a lower number!\n"
	GuessIsTrue=1
	read UsersGuess
else
	printf "CONGRATULATIONS!  You got it! There are ${NumberOfFiles} in the current directory!\n"
	GuessIsTrue=0
fi
done
}

WelcomeMessage
ProcessInput
