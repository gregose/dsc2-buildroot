from Adafruit_BBIO.SPI import SPI

# From Adafruit Learning System:
# https://learn.adafruit.com/setting-up-io-python-library-on-beaglebone-black/spi     
#spi = SPI(bus, device) #/dev/spidev<bus>.<device>
#spi = SPI(0,0)	#/dev/spidev1.0
#spi = SPI(0,1)	#/dev/spidev1.1
#spi = SPI(1,0)	#/dev/spidev2.0
#spi = SPI(1,1)	#/dev/spidev2.1

spi = SPI(0,0)
print spi.xfer2([32, 11, 110, 22, 220])
spi.close()
