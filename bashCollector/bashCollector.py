#!/usr/bin/Python

import os
import subprocess
import re

wlan_cmd = 'echo /sys/class/net/*/wireless | awk -F"/" "{ print \$5 }"'
get_wlan_device = subprocess.Popen(wlan_cmd, shell=True, stdout=subprocess.PIPE)
wlan_device = str(get_wlan_device.stdout.read().decode().rstrip())

ip_command1  = f"ifconfig {wlan_device} "
ip_command2 = "| grep 192 | awk '{print $2}'"
ip_command = ip_command1+ip_command2

get_ip = subprocess.Popen(ip_command, shell=True, stdout=subprocess.PIPE)
ip = get_ip.stdout.read().decode()
#print("Die interne IP Adresse des Systems lautet:\n" + ip + "\n")

ext_cmd = "host myip.opendns.com resolver1.opendns.com | grep myip | sed 's/.*[[:blank:]]//'"
get_ext = subprocess.Popen(ext_cmd, shell=True, stdout=subprocess.PIPE)
ext = get_ext.stdout.read().decode()

name_command = "cat /etc/os-release | grep NAME"
get_name = subprocess.Popen(name_command, shell=True, stdout=subprocess.PIPE)
name = get_name.stdout.read().decode()
name = str(list(set(re.findall(r'"([^"]*)"',name)))[0])
#print("Der Name des Betriebssystems lautet:\n" + name + "\n")

lsblk_command =  "lsblk | grep part | awk '{print $4}' | sed 's/[^0-9,]//g'"
get_lsblk = subprocess.Popen(lsblk_command,shell=True, stdout=subprocess.PIPE)
lsblk = get_lsblk.stdout.read().decode()
lsblk = lsblk.replace(',', '.')
lsblk = lsblk.split("\n")
#lsblk = float(lsblk[0]) + float(lsblk[1])
sum = 0.0
for i in range(0,len(lsblk)-1):
	sum = sum + float(lsblk[i])
lsblk = int(sum)

#print ("Der Benutzer hat "+ str (lsblk) + " GB Speicher auf den Festplatten. \n")

username_command  = "whoami"
get_username = subprocess.Popen(username_command, shell=True, stdout=subprocess.PIPE)
username = get_username.stdout.read().decode()
#print("Der Benutzername des Systems lautet:\n" + username + "\n")

uptime_command = "uptime -s / top"
get_uptime = subprocess.Popen(uptime_command, shell=True, stdout=subprocess.PIPE)
uptime = get_uptime.stdout.read().decode()
#print("Der Benutzer hat sich seit " + uptime.rstrip() + " eingeloggt.\n")

appcount_cmd ="ls /usr/share/applications | wc -l"
get_appcount = subprocess.Popen(appcount_cmd, shell=True, stdout=subprocess.PIPE)
appcount =  get_appcount.stdout.read().decode()
#print("Der Benutzer hat " + str(appcount.rstrip()) + " installierte Programme auf dem Rechner")

os.system("rm -f system.info")
os.system("touch system.info")
file1 = open("system.info", "a")

file1.write("Die interne IP Adresse des Systems lautet: " + ip + "\n")
file1.write("Die externe IP Adresse des Systems lautet: " + ext + "\n")
file1.write("Der Name des Betriebssystems lautet: " + name.rstrip() + "\n\n")
file1.write("Der Benutzer hat "+ str (lsblk) + " GB Speicher auf den Festplatten. \n\n")
file1.write("Der Benutzername des Systems lautet: " + username + "\n")
file1.write("Der Benutzer hat sich seit " + uptime.rstrip() + " eingeloggt.\n\n")
file1.write("Der Benutzer hat " + str(appcount.rstrip()) + " installierte Programme auf dem Rechner \n\n")

file1.close()