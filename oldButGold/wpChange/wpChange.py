#!/usr/bin/env python
import sys
import os
import shutil
import random
import webbrowser
import getpass
import subprocess

working = os.getcwd()
username = getpass.getuser()
wpPath = "/usr/share/backgrounds"
randomPath = ""
picList = []


##LinuxTool
##GeneratingFromGoogle
##ToDo

##Unwritten
def readWp(path):
  return diveRecursivly(path)

def diveRecursivly(files):
   return(files)

if os.path.exists("/home/"+username+"/wallpaper"):
  print("Reading wallpapers..")

else:
  try:
    os.makedir("/home/"+username+"/wallpaper")
  except:
    print("Could not Create new Directory")
    print("Probably a WinniehDose")
##OUT
piclist = readWp(randomPath)
print("\nStill Unwritten")
print("DePen's on the rand() \n" +randomPath+"\n\n")

