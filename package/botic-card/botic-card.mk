################################################################################
#
# botic-card
#
################################################################################

BOTIC_CARD_VERSION = latest
BOTIC_CARD_SITE = $(realpath $(BOTIC_CARD_PKGDIR))
BOTIC_CARD_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
