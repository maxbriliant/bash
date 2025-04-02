#!/bin/bash

pactl suspend-sink output.pci-0000_00_1b.0.analog-stereo 1

pulseaudio -k
#pulseaudio --realtime start
pacmd set-default-sink jack_out
set-default-source jack_in

pactl load-module module-jack-sink
pactl load-module module-jack-source
