# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 Sarah Maedel

# FIT will be loaded at 0x02080000. Leave 16M for that, align it to 2M and load the kernel after it.
KERNEL_LOADADDR := 0x03200000

define Device/IfnameMigration
  DEVICE_COMPAT_VERSION := 1.1
  DEVICE_COMPAT_MESSAGE := Network interface names have been changed
endef


define Device/hinlink_opc-h29k
  DEVICE_VENDOR := HINLINK
  DEVICE_MODEL := OPC-H29K
  SOC := rk3528
  UBOOT_DEVICE_NAME := generic-rk3528
  IMAGE/sysupgrade.img.gz := boot-common | boot-script rk3528 | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-fb-tft-st7789v wpad-openssl -urngd
endef
TARGET_DEVICES += hinlink_opc-h29k
