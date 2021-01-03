################################################################################
#
# python-lumaoled
#
################################################################################

PYTHON_LUMAOLED_VERSION = 3.8.1
PYTHON_LUMAOLED_SOURCE = luma.oled-$(PYTHON_LUMAOLED_VERSION).tar.gz
PYTHON_LUMAOLED_SITE = https://files.pythonhosted.org/packages/b9/73/f356d7a561eeb06c5ed6fed6eb4b78eb54259b9a9dc11245e72ac4f1b34c
PYTHON_LUMAOLED_SETUP_TYPE = setuptools
PYTHON_LUMAOLED_LICENSE = MIT
PYTHON_LUMAOLED_LICENSE_FILES = LICENSE.rst

$(eval $(python-package))
