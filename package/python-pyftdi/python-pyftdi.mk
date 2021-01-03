################################################################################
#
# python-pyftdi
#
################################################################################

PYTHON_PYFTDI_VERSION = 0.52.0
PYTHON_PYFTDI_SOURCE = pyftdi-$(PYTHON_PYFTDI_VERSION).tar.gz
PYTHON_PYFTDI_SITE = https://files.pythonhosted.org/packages/46/9d/78ef718e9616759fa249ba8e379d88014bd8e352beceb567042403b2be54
PYTHON_PYFTDI_SETUP_TYPE = setuptools
PYTHON_PYFTDI_LICENSE = FIXME: please specify the exact BSD version
PYTHON_PYFTDI_LICENSE_FILES = pyftdi/doc/license.rst

$(eval $(python-package))
