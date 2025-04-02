#!/usr/bin/bash

FILENAME=$(dialog --stdout  --title "Please choose an Epub" --fselect $HOME/Desktop/CodingBooks/ );
read  -n 1 -p "('$FILENAME') File Selected, Press Enter:" 

finish() {
mupdf-gl -S 54 -r 47 -W 1368 -H 768 "$FILENAME";

while IFS= read -r $pidsFull; do 
	pkill -P (ps -ax -o pid,command | grep mupdf | grep -v epub | head -c7 | tail -c5)
	pkill -P (ps -ax -o pid,command | grep qterminal | head -c7 | tail -c5)
done < "$1"

}
trap finish EXIT
