export TARGET_CODESIGN_FLAGS="-Ssign.plist"
export ARCHS = arm64
export TARGET = iphone:clang:16.5:14.0
GO_EASY_ON_ME=1
include $(THEOS)/makefiles/common.mk

ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
	PACKAGE_BUILDNAME := rootless
else
	PACKAGE_BUILDNAME := rootful
endif

TOOL_NAME = ipainstaller
$(TOOL_NAME)_FILES = \
					ZipArchive/minizip/ioapi.c \
					ZipArchive/minizip/mztools.c \
					ZipArchive/minizip/unzip.c \
					ZipArchive/minizip/zip.c \
					ZipArchive/ZipArchive.mm \
					UIDevice-Capabilities/UIDevice-Capabilities.m \
					main.mm
$(TOOL_NAME)_FRAMEWORKS = Foundation UIKit ImageIO CoreGraphics
$(TOOL_NAME)_PRIVATE_FRAMEWORKS = MobileCoreServices
$(TOOL_NAME)_LDFLAGS = MobileInstallation -lz
$(TOOL_NAME)_INSTALL_PATH = /usr/bin

include $(THEOS)/makefiles/tool.mk

VERSION.INC_BUILD_NUMBER = 1
