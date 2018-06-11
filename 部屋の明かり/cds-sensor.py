import RPi.GPIO as GPIO
import spidev
import time
import subprocess
import commands

spi = spidev.SpiDev()
spi.open(0 , 0)

try:
    while True:
        resp = spi.xfer2([0x68, 0x00])
        value = (resp[0] * 256 + resp[1]) & 0x3ff
        print value
        time.sleep(0.1)

        if value < 50:

                check = commands.getoutput(" sh cds-0.sh ")
                print check
                time.sleep(0.1)

        if value > 180:

                time.sleep(10)


        else:
                check = commands.getoutput(" sh cds-1.sh ")
                print check
                time.sleep(0.1)

except KeyboardInterrupt:
    spi.close()


GPIO.cleanup()
#shell の場所はフルで書いたほうがいい
