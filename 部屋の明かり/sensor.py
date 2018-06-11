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

                check = commands.getoutput(" sh /home/pi/light-sensor/cds-0.sh ")
                print check
                time.sleep(0.4)

        if value > 150:

                time.sleep(60)


        else:
                check = commands.getoutput(" sh /home/pi/light-sensor/sensor-light.sh ")
                print check
                time.sleep(0.4)

except KeyboardInterrupt:
    spi.close()

### sensor-light.py
### cds-0.sh
### cds-1.sh *change this*
