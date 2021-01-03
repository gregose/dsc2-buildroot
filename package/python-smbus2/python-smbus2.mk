################################################################################
#
# python-smbus2
#
################################################################################

PYTHON_SMBUS2_VERSION = 0.4.0
PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/31/d1/81f53087d59a0e33d9b44568d9988a083da364d3ef025356c8cec6325af8
PYTHON_SMBUS2_SETUP_TYPE = setuptools
PYTHON_SMBUS2_LICENSE = MIT
PYTHON_SMBUS2_LICENSE_FILES = LICENSE

$(eval $(python-package))
