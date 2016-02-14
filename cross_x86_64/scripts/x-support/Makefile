include config.kanapi
include rules.kanapi

PKGS=pkg-config kbproto xproto xextproto libXau xcb-proto libpthread-stubs libxcb \
	 xtrans inputproto libX11 libXext util-macros fixesproto libXfixes damageproto \
	 libXdamage xf86driproto xcmiscproto bigreqsproto randrproto renderproto \
	 fontsproto videoproto compositeproto recordproto scrnsaverproto resourceproto \
	 xineramaproto xf86dgaproto xf86vidmodeproto dri2proto dri3proto glproto \
	 presentproto pixman libxkbfile libpng freetype font-util libfontenc libXfont \
	 xkeyboard-config xkbcomp mkfontscale mkfontdir bdftopcf font-cursor-misc \
	 libdrm libxshmfence pci.ids cacert libusb usbutils udev expat mesa openssl \
	 xcb-util-keysyms xorg-server xinit libICE libSM libXt libXmu libXpm libXaw \
	 xterm xf86-inout-keyboard xf86-input-mouse libevdev mtdev xf86-input-evdev \
	 xf86-video-intel

all: $(PKGS)

# BASE SYSTEM
zlib:

llvm:

ncurses:

#
#
# PACKAGES

libffi:
	@$(RUN_TARGET)

glib: libffi
	@$(RUN_TARGET)

pkg-config: glib 
	@$(RUN_TARGET)

kbproto:
	@$(RUN_TARGET)

xproto:
	@$(RUN_TARGET)

xextproto:
	@$(RUN_TARGET)

libXau: xproto
	@$(RUN_TARGET)

xcb-proto:
	@$(RUN_TARGET)

libpthread-stubs:
	@$(RUN_TARGET)

libxcb: xcb-proto libpthread-stubs libXau
	@$(RUN_TARGET)

xtrans:
	@$(RUN_TARGET)

inputproto:
	@$(RUN_TARGET)

libX11: xproto xextproto xtrans libxcb kbproto inputproto
	@$(RUN_TARGET)

libXext:	
	@$(RUN_TARGET)

util-macros:	
	@$(RUN_TARGET)

fixesproto:
	@$(RUN_TARGET)

libXfixes: fixesproto libX11
	@$(RUN_TARGET)

damageproto:
	@$(RUN_TARGET)

libXdamage: damageproto
	@$(RUN_TARGET)

xf86driproto:
	@$(RUN_TARGET)

xcmiscproto:
	@$(RUN_TARGET)

bigreqsproto:
	@$(RUN_TARGET)

randrproto:
	@$(RUN_TARGET)

renderproto:
	@$(RUN_TARGET)

fontsproto:
	@$(RUN_TARGET)

videoproto:
	@$(RUN_TARGET)

compositeproto:
	@$(RUN_TARGET)

recordproto:
	@$(RUN_TARGET)

scrnsaverproto:
	@$(RUN_TARGET)

resourceproto:
	@$(RUN_TARGET)

xineramaproto:
	@$(RUN_TARGET)

xf86dgaproto:
	@$(RUN_TARGET)

xf86vidmodeproto:
	@$(RUN_TARGET)

dri2proto:
	@$(RUN_TARGET)

dri3proto:
	@$(RUN_TARGET)

glproto:
	@$(RUN_TARGET)

presentproto:
	@$(RUN_TARGET)

pixman:
	@$(RUN_TARGET)

libpng: zlib
	@$(RUN_TARGET)

libxkbfile:
	@$(RUN_TARGET)

freetype: libpng
	@$(RUN_TARGET)

font-util:
	@$(RUN_TARGET)

libfontenc: zlib font-util
	@$(RUN_TARGET)

libXfont: zlib
	@$(RUN_TARGET)

xkeyboard-config:
	@$(RUN_TARGET)

xkbcomp: libxcb
	@$(RUN_TARGET)

mkfontscale: libpng
	@$(RUN_TARGET)

mkfontdir: mkfontscale
	@$(RUN_TARGET)

bdftopcf: freetype libfontenc
	@$(RUN_TARGET)

font-cursor-misc: freetype libfontenc libXfont
	@$(RUN_TARGET)

libdrm:
	@$(RUN_TARGET)

libxshmfence:
	@$(RUN_TARGET)

pci.ids:
	@$(RUN_TARGET)

cacert:
	@$(RUN_TARGET)

libusb:
	@$(RUN_TARGET)

usbtuils: libusb zlib
	@$(RUN_TARGET)

udev: pci.ids usbutils
	@$(RUN_TARGET)

expat:
	@$(RUN_TARGET)

mesa: libxshmfence udev expat
	@$(RUN_TARGET)

openssl:
	@$(RUN_TARGET)

xcb-util-keysyms:
	@$(RUN_TARGET)

xorg-server: dri3proto dri2proto xf86driproto libxcb xcb-util-keysyms llvm
	@$(RUN_TARGET)

xinit: libxcb
	@$(RUN_TARGET)

libICE:
	@$(RUN_TARGET)

libSM:
	@$(RUN_TARGET)

libXt:
	@$(RUN_TARGET)

libXmu:
	@$(RUN_TARGET)

libXpm:
	@$(RUN_TARGET)

libXaw:
	@$(RUN_TARGET)

xterm: libXext libxcb libXau libXpm libX11 ncurses
	@$(RUN_TARGET)

xf86-input-keyboard:
	@$(RUN_TARGET)

xf86-input-mouse:
	@$(RUN_TARGET)

libevdev:
	@$(RUN_TARGET)

mtdev:
	@$(RUN_TARGET)

xf86-input-evdev: mtdev libevdev libudev
	@$(RUN_TARGET)

xf86-video-intel: libXfont freetype libpng libfontenc
	@$(RUN_TARGET)

download version prepare configure build install rebuild check:
	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

