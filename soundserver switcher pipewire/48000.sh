#!/bin/bash

# Pfad zur Pipewire-Konfigurationsdatei
pipewire_config_file="/home/maksim/.config/pipewire/pipewire.conf"
desktop_file="/home/maksim/local/share/applications/org.rncbc.qjackctl.desktop"
#desktop_file="/usr/share/applications/org.rncbc.qjackctl"


# Kommentiere die 96000er Zeilen aus
sed -i -e "/^default.clock.rate *= 96000/,/^$/s/^\(.*\)$/#\1/" "$pipewire_config_file"
sed -i -e "/^default.clock.allowed-rates *= \[[[:space:]]*96000[[:space:]]*\]/,/^$/s/^\(.*\)$/#\1/" "$pipewire_config_file"

# Entferne Kommentarzeichen aus den 48000er Zeilen
sed -i -e "/^#default.clock.rate *= 48000/s/^#//" "$pipewire_config_file"
sed -i -e "/^#default.clock.allowed-rates *= \[[[:space:]]*48000[[:space:]]*\]/s/^#//" "$pipewire_config_file"

# Entferne Kommentarzeichen aus Leerzeilen
sed -i -e "/^# *$/s/^#//" "$pipewire_config_file"

# Pipewire Service kurz neustarten
/usr/bin/systemctl --user restart pipewire

# Funktion zum Aktualisieren der .desktop-Datei
update_desktop_file() {
    sed -i "/^Name=48 KHz/c\Name=48 KHz (!)" "$desktop_file"
    sed -i "/^Name=96 KHz/c\Name=96 KHz" "$desktop_file"
}

# Aktualisiere die .desktop-Datei
update_desktop_file
