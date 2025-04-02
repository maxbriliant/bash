#!/usr/bin/python

from selenium import webdriver
from selenium.webdriver.common.by import By
import sys
import time

from selenium.webdriver.chrome.options import Options

chrome_options = Options()
chrome_options.add_argument("--kiosk")
driver = webdriver.Chrome(chrome_options=chrome_options)
driver.maximize_window()
driver.get('https://meditationtimer.online/?d=11&i=5')

 ## TODO: TERMINAL ARGUMENT FOR PYTHON
 #image_text = "A cat guy on unicorns"

time.sleep(3)

button_element = driver.find_element(By.XPATH, '/html/body/main/div/div[2]/button[2]')
button_element.click()
