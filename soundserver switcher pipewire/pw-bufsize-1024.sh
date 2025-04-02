#!/bin/bash
pw-metadata -n settings 0 clock.force-rate 0 &&
pw-metadata -n settings 0 clock.force-quantum 0;
sleep 1;
pw-metadata -n settings 0 clock.force-quantum 1024;
