
export THEOS_DEVICE_IP = 192.168.122.228
export TARGET_CODESIGN_FLAGS="-Ssign.plist"
export ARCHS = armv7 arm64
export TARGET = iphone:clang:9.3:8.0
GO_EASY_ON_ME=1
include theos/makefiles/common.mk

TOOL_NAME = ipainstaller
ipainstaller_FILES = \
					ZipArchive/minizip/ioapi.c \
					ZipArchive/minizip/mztools.c \
					ZipArchive/minizip/unzip.c \
					ZipArchive/minizip/zip.c \
					ZipArchive/ZipArchive.mm \
					UIDevice-Capabilities/UIDevice-Capabilities.m \
					main.mm
ipainstaller_FRAMEWORKS = Foundation UIKit ImageIO CoreGraphics
ipainstaller_PRIVATE_FRAMEWORKS = MobileCoreServices
ipainstaller_LDFLAGS = MobileInstallation -lz
ipainstaller_INSTALL_PATH = /usr/bin

include theos/makefiles/tool.mk

VERSION.INC_BUILD_NUMBER = 1

after-clean::
	rm -rf obj/ packages/ .theos/
