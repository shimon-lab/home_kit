#!/usr/bin/python
# coding: UTF

import time
import RPi.GPIO as GPIO

def human(sensor):

        SENSOR_PIN = 25
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(SENSOR_PIN, GPIO.IN, pull_up_down=GPIO.PUD_UP)

        time.sleep(0.1)
        human = GPIO.input(SENSOR_PIN)

        return human

        GPIO.cleanup()

print human(0)
