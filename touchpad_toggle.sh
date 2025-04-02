#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.
# check xinput list for id=??

TOGGLE=$HOME/.toggle_touchpad

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    synclient touchpadoff=1
    xinput disable 11
    notify-send -u low -i mouse --icon=/usr/share/icons/HighContrast/256x256/status/touchpad-disabled.png "Trackpad disabled"
else
    rm $TOGGLE
    xinput enable 11
    synclient touchpadoff=0
    notify-send -u low -i mouse --icon=/usr/share/icons/HighContrast/256x256/devices/input-touchpad.png "Trackpad enabled"
fi
