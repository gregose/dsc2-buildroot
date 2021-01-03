################################################################################
#
# python-adafruit-bbio
#
################################################################################

PYTHON_ADAFRUIT_BBIO_VERSION = 1.2.0
PYTHON_ADAFRUIT_BBIO_SOURCE = Adafruit_BBIO-$(PYTHON_ADAFRUIT_BBIO_VERSION).tar.gz
PYTHON_ADAFRUIT_BBIO_SITE = https://files.pythonhosted.org/packages/19/db/0d7afa47b97bb3786b564032fe56b0cf2bf7537ef96c24ae1d95fa4c54e9
PYTHON_ADAFRUIT_BBIO_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_BBIO_LICENSE = MIT

$(eval $(python-package))
