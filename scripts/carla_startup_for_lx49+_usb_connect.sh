#!/bin/bash



### Preparations: Paste this Service

## ADD  xhost +SI:localuser:maksim 
## TO   ~/.xsession

## nano .config/systemd/user/carla-usb.service

#[Service]
#Type=simple
#Environment=HOME=/home/maksim
#Environment=XDG_RUNTIME_DIR=/run/user/1000
#Environment=DISPLAY=:0.0
#Environment=XAUTHORITY=/home/maksim/.Xauthority
#ExecStart=/home/maksim/Carla/carla_startup_for_lx49+_usb_connect.sh
#Restart=always
#RestartSec=2
#
#[Install]
#WantedBy=default.target



#### Then run:
## systemctl --user daemon-reload 
## systemctl --user enable carla-usb.service
## systemctl --user start carla-usb.service
####


# Vendor and product IDs of the USB device
VENDOR_ID="2467"
PRODUCT_ID="2015"

# Path to the file storing the information about the initial USB connection
INITIAL_USB_FILE="/home/maksim/Carla/.initial_usb_connect.txt"

# Function to check if USB device is connected
is_usb_device_connected() {
    # Check if the USB device is connected using vendor and product IDs
    lsplug | grep "$VENDOR_ID:$PRODUCT_ID" > /dev/null
}

# Function to start Carla
start_carla() {
    # Load environment variables for the current user
    source /etc/profile
    source "/home/maksim/.bashrc"
    export XDG_RUNTIME_DIR="/run/user/1000"
    export DISPLAY=:0.0
    export XAUTHORITY="/home/maksim/.Xauthority"
    midi-to-keys&

    # Execute the desired script with Carla
    carla /home/maksim/Carla/SteinwayNewYork.carxp
}


# Benutzername für Carla
CARLA_USER="maksim"

## Funktion zum Überprüfen, ob Carla bereits läuft
#is_carla_running() {
#    pkill -fu "$CARLA_USER" carla > /dev/null
#}




# ...

# Hauptschleife
while true; do
    # Check if USB device is connected
    if is_usb_device_connected; then
        # Check if the initial USB connection file exists
        if [ ! -f "$INITIAL_USB_FILE" ]; then
            echo "USB device connected. Starting Carla..."
           #dbus-send --print-reply --dest=org.freedesktop.PowerManagement.Inhibit /org/freedesktop/PowerManagement/Inhibit org.freedesktop.PowerManagement.Inhibit.Inhibit string:"Carla" string:"Piano"

            start_carla
            # Create the initial USB connection file
            touch "$INITIAL_USB_FILE"
        fi
    else
        # Remove the initial USB connection file when the device is disconnected
        #dbus-send --dest=org.freedesktop.PowerManagement.Inhibit /org/freedesktop/PowerManagement/Inhibit org.freedesktop.PowerManagement.Inhibit.UnInhibit uint32:1
	rm -f "$INITIAL_USB_FILE"
    fi

    # Wait for 2 seconds before checking again
    sleep 2
done

