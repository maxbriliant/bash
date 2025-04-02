#!/bin/bash
pw-metadata -n settings 0 clock.force-rate 0 &&
pw-metadata -n settings 0 clock.force-quantum 0;
sleep 1;
pw-metadata -n settings 0 clock.force-quantum 8192;

# Pfad zur Desktopdatei
desktop_file="/home/maksim/.local/share/applications/org.rncbc.qjackctl.desktop"

# Extrahiere die Zahl aus dem Skriptnamen (z.B. 512.sh -> 512)
number=$(basename "$0" | sed 's/[^0-9]*//g')

# Aktualisiere die Desktopdatei
sed -i '/^Name=/s/\*//' "$desktop_file" # Entferne alle vorhandenen Sterne
sed -i "/^Name=$number/s/$/*/" "$desktop_file" # Füge einen Stern zur ausgewählten Zeile hinzu
