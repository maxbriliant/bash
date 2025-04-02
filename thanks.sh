#!/bin/bash

# Überprüfe, ob ein Argument übergeben wurde
if [ -z "$1" ]; then
  echo "Usage: $0 <user_input>"
  exit 1
fi

# Benutzerinput speichern
userinput="$1"

# Füge eine zufällige Antwort hinzu
responses=("Your wish may be granted" "You're Welcome" "Let's do this!" "C' Capitan!" "Alright, Max!")
random_response=${responses[$((RANDOM % ${#responses[@]}))]}

# Simuliere eine kurze Verzögerung
sleep $((RANDOM % 5 + 1))s

# Gib die erweiterte Antwort aus
echo -e "$userinput!\n$random_response"