#!/bin/bash

# Pfad zu yay setzen (bitte entsprechend anpassen)
YAY_PATH=/usr/bin/yay

# Überprüfen, ob die Pakete installiert sind
if $YAY_PATH -Qi tonelib-gfx-bin tonelib-tube-warmth-bin tonelib-noise-reducer-bin tonelib-metal-bin tonelib-bass-drive-bin tone-lib-jam-bin  &> /dev/null; then
    # Pakete deinstallieren, wenn sie installiert sind
    if $YAY_PATH -Rns tonelib-gfx-bin tonelib-tube-warmth-bin tonelib-noise-reducer-bin tonelib-metal-bin tonelib-bass-drive-bin tone-lib-jam-bin; then
        echo "Deinstallation erfolgreich abgeschlossen!"
    else
        echo "Es gab einen Fehler beim Deinstallieren der alten Pakete. Bitte überprüfe die Ausgabe des yay-Befehls und versuche es erneut."
        exit 1
    fi
fi

# Konfigurationsdateien löschen
rm -r /home/maksim/.config/Gadwin/
rm -r /home/maksim/Dokumente/ToneLib/

# Neue Pakete installieren
if $YAY_PATH --noconfirm -S tonelib-gfx-bin tonelib-tube-warmth-bin tonelib-noise-reducer-bin tonelib-metal-bin tonelib-bass-drive-bin tone-lib-jam-bin; then
    echo "Installation erfolgreich abgeschlossen!"
else
    echo "Es gab einen Fehler beim Installieren der neuen Pakete. Bitte überprüfe die Ausgabe des yay-Befehls."
fi
