################################################################################
#
# python-lumacore
#
################################################################################

PYTHON_LUMACORE_VERSION = 2.2.0
PYTHON_LUMACORE_SOURCE = luma.core-$(PYTHON_LUMACORE_VERSION).tar.gz
PYTHON_LUMACORE_SITE = https://files.pythonhosted.org/packages/18/c7/591c2cdd4362273e5f8a41085d0e34c61debec9cd2adfd9e5090dde5603f
PYTHON_LUMACORE_SETUP_TYPE = setuptools
PYTHON_LUMACORE_LICENSE = MIT
PYTHON_LUMACORE_LICENSE_FILES = LICENSE.rst

$(eval $(python-package))
