#!/bin/bash

# Farben definieren
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

# CPU Usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | \
            sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
            awk '{print int(100 - $1)"%"}')

# RAM Usage
ram_usage=$(top -bn1 | awk '/MiB Mem/ {match($0, /([0-9.]+) total,.* ([0-9.]+) used/, arr); print int(arr[2] / arr[1] * 100) "%"}')

# Festplattenbelegung (sda1, /dev/nvme*)
disk_usage=$(df -h | grep -E '(/dev/sda1|/dev/nvme.*p[12])' | awk '{
    if ($1 == "/dev/sda1") {
        # Füge für sda1 zwei Tabulatoren hinzu, um die Ausrichtung zu korrigieren
        print substr($1, 6) ": \t\t" $3 " / " $2 " (" $5 ")"
    } else {
        # Für alle anderen Partitionen (nvme*1, nvme*2) ohne zusätzliche Tabulatoren
        print substr($1, 6) ": \t" $3 " / " $2 " (" $5 ")"
    }
}' | uniq)

# Ausgabe mit Farben
echo ""
echo -e "${CYAN}CPU Usage:${RESET} ${YELLOW}$cpu_usage${RESET}"
echo -e "${CYAN}RAM Usage:${RESET} ${YELLOW}$ram_usage${RESET}"
echo ""
echo -e "${CYAN}Disk Usage:${RESET}"
printf "${GREEN}%s${RESET}\n" "$disk_usage"
echo ""
