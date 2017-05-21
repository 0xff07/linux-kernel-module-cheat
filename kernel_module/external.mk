################################################################################
#
# kernel_module
#
################################################################################

KERNEL_MODULE_VERSION = 1.0
KERNEL_MODULE_SITE = $(BR2_EXTERNAL_KERNEL_MODULE_PATH)
KERNEL_MODULE_SITE_METHOD = local

define KERNEL_MODULE_BUILD_CMDS
	$(MAKE) \
	  -C '$(@D)' \
	  ARCH='$(KERNEL_ARCH)' \
	  CC='$(TARGET_CC)' \
	  CROSS_COMPILE='$(TARGET_CROSS)' \
	  LD='$(TARGET_LD)' \
	  LINUX_DIR='$(LINUX_DIR)' \
	  PWD='$(@D)'
endef

define KERNEL_MODULE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0655 $(@D)/*.ko '$(TARGET_DIR)'
	$(INSTALL) -D -m 0755 $(@D)/test/*.out '$(TARGET_DIR)'
endef

$(eval $(kernel-module))
$(eval $(generic-package))
