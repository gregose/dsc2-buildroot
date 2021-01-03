################################################################################
#
# python-deprecated
#
################################################################################

PYTHON_DEPRECATED_VERSION = 1.2.10
PYTHON_DEPRECATED_SOURCE = Deprecated-$(PYTHON_DEPRECATED_VERSION).tar.gz
PYTHON_DEPRECATED_SITE = https://files.pythonhosted.org/packages/c1/2d/60b1be29720ea1a3d3146fac1a596875622ae8dcb40cf926cc4759dadfd6
PYTHON_DEPRECATED_SETUP_TYPE = setuptools
PYTHON_DEPRECATED_LICENSE = MIT
PYTHON_DEPRECATED_LICENSE_FILES = LICENSE.rst docs/source/license.rst

$(eval $(python-package))
