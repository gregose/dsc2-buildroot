################################################################################
#
# botic-codec
#
################################################################################

BOTIC_CODEC_VERSION = latest
BOTIC_CODEC_SITE = $(realpath $(BOTIC_CODEC_PKGDIR))
BOTIC_CODEC_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
