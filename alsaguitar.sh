#!/bin/bash

env >> /home/max/source/bash/alsaguitar.log

if [ "${ACTION}" == add -a -d "/sys${DEVPATH}" ]; then
sudo alsactl restore
echo "add ${DEVPATH}" >> /home/max/source/bash/alsaguitar.log
fi
