import math
import time
import datetime

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

while True:
  font = ImageFont.truetype('/home/pi/font/misaki_mincho.ttf', 24, encoding='unic')
  date_str = datetime.datetime.now().strftime("20%y %m/%d")
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
          y = 5
          draw.text((x, y), c, font=font, fill=255)
          char_width, char_height = draw.textsize(c, font=font)
          x += char_width

  font = ImageFont.truetype('/home/pi/font/misaki_mincho.ttf', 32, encoding='unic')
  time_str = datetime.datetime.now().strftime("%H:%m:%S")
  maxwidth, unused = draw.textsize(time_str, font=font)
  x=0
  for i, c in enumerate(time_str):
          if x > width:
              break
          if x < -20:
              char_width, char_height = draw.textsize(c, font=font)
              x += char_width
              continue
          y = 25
          draw.text((x, y), c, font=font, fill=255)
          char_width, char_height = draw.textsize(c, font=font)
          x += char_width

  disp.image(image)
  disp.display()
