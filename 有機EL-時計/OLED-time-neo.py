#!/usr/bin/python
# coding: UTF

import time
import datetime
import RPi.GPIO as GPIO
import os

import Adafruit_GPIO.SPI as SPI
import Adafruit_SSD1306

from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw

RST = 24
disp = Adafruit_SSD1306.SSD1306_128_64(rst=RST)
disp.begin()
width = disp.width
height = disp.height
disp.clear()
disp.display()
image = Image.new('1', (width, height))
draw = ImageDraw.Draw(image)
SENSOR_PIN = 25
GPIO.setmode(GPIO.BCM)
GPIO.setup(SENSOR_PIN, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(RST ,GPIO.OUT)

while True:

  pin_status = GPIO.input(SENSOR_PIN)
  time.sleep(1)
  while pin_status==1:

            time.sleep(0.1)
            pin_status = GPIO.input(SENSOR_PIN)

            font = ImageFont.truetype('/home/pi/font/OpenSans-Light.ttf', 22, encoding='unic')
            date_str = datetime.datetime.now().strftime(" %m/%d %a")
            maxwidth, unused = draw.textsize(date_str, font=font)
            draw.rectangle((0,0,width,height), outline=0, fill=0)
            x=0
            for i, c in enumerate(date_str):
                if x > width:
                    break
                if x < -20:
                    char_width, char_height = draw.textsize(c, font=font)
                    x += char_width
                    continue
                y = 2
                draw.text((x, y), c, font=font, fill=255)
                char_width, char_height = draw.textsize(c, font=font)
                x += char_width

            font = ImageFont.truetype('/home/pi/font/7barP.TTF', 35, encoding='unic')
            time_str = datetime.datetime.now().strftime("%H:%M")
            x=2
            for i, c in enumerate(time_str):
                if x > width:
                    break
                if x < -20:
                    char_width, char_height = draw.textsize(c, font=font)
                    x += char_width
                    continue
                y = 29
                draw.text((x, y), c, font=font, fill=255)
                char_width, char_height = draw.textsize(c, font=font)
                x += char_width

            time_str = datetime.datetime.now().strftime("%S")
            x=85
            for i, c in enumerate(time_str):
                if x > width:
                    break
                if x < -20:
                    char_width, char_height = draw.textsize(c, font=font)
                    x += char_width
                    continue
                y = 29
                draw.text((x, y), c, font=font, fill=255)
                char_width, char_height = draw.textsize(c, font=font)
                x += char_width

            time_str = datetime.datetime.now().strftime(" :")
            x=61
            for i, c in enumerate(time_str):
                if x > width:
                    break
                if x < -20:
                    char_width, char_height = draw.textsize(c, font=font)
                    x += char_width
                    continue
                y = 29
                draw.text((x, y), c, font=font, fill=255)
                char_width, char_height = draw.textsize(c, font=font)
                x += char_width

                disp.image(image)
                disp.display()

            if pin_status==0:
                disp.clear()
                disp.display()
