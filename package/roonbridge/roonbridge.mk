###
#
# roonbridge
#
##

ROONBRIDGE_SOURCE = RoonBridge_linux$(call qstrip,$(BR2_PACKAGE_ROONBRIDGE_ARCH)).tar.bz2
ROONBRIDGE_SITE = https://download.roonlabs.com/builds

define ROONBRIDGE_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/RoonBridge
	cp -r $(@D)/* $(TARGET_DIR)/opt/RoonBridge
endef

define ROONBRIDGE_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 $(ROONBRIDGE_PKGDIR)/roonbridge.service \
		$(TARGET_DIR)/usr/lib/systemd/system/roonbridge.service
endef

define ROONBRIDGE_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 $(ROONBRIDGE_PKGDIR)/S95roonbridge \
		$(TARGET_DIR)/etc/init.d/S95roonbridge
endef

$(eval $(generic-package))
