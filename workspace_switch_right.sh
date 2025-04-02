#!/bin/bash

# Funktion zur Überprüfung, ob der aktuelle Workspace der höchste ist
is_highest_workspace() {
    current_workspace=$(xdotool get_desktop)
    highest_workspace=3  # Da die Workspace-Zählung bei 0 beginnt, ist der höchste Workspace 3
    if [ "$current_workspace" -eq "$highest_workspace" ]; then
        return 0
    else
        return 1
    fi
}

# Funktion zur Überprüfung, ob der aktuelle Workspace der niedrigste ist
is_lowest_workspace() {
    current_workspace=$(xdotool get_desktop)
    lowest_workspace=0
    if [ "$current_workspace" -eq "$lowest_workspace" ]; then
        return 0
    else
        return 1
    fi
}

# Skript für den Workspace nach links
move_workspace_left() {
    if ! is_lowest_workspace; then
        xdotool set_desktop --relative -- -1 && notify-send -t 1000 "Workspace" "$(($(xdotool get_desktop)+1))"
    else
        echo -e "\a"  # Beep sound
    fi
}

# Skript für den Workspace nach rechts
move_workspace_right() {
    if ! is_highest_workspace; then
        xdotool set_desktop --relative -- 1 && notify-send -t 1000 "Workspace" "$(($(xdotool get_desktop)+1))"
    else
        echo -e "\a"  # Beep sound
    fi
}

# Hier rufst du die Funktion entsprechend auf, z.B.:
# move_workspace_left
# oder
 move_workspace_right
