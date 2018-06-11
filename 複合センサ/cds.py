import spidev
import time
import subprocess
import commands

def cds(sensor):

        spi = spidev.SpiDev()
        spi.open(0 , 0)

        time.sleep(0.1)

        resp = spi.xfer2([0x68, 0x00])
        cds = (resp[0] * 256 + resp[1]) & 0x3ff

        return cds

        spi.close()

print cds(0)
