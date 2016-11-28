ifeq (x$(KANAPI_TOP),x)
BASE=
else
BASE=$(KANAPI_TOP)/
endif
include $(BASE)../../cross_compilers/scripts/config.kanapi
include $(BASE)../scripts/config.kanapi
include $(BASE)../scripts/config-Makefile.kanapi
include $(BASE)../scripts/rules.kanapi

all: cross_gcc rootfs sbs kbs native_gcc sdl-support x-support

#SBS - second build system 
sbs: busybox bash make autoconf automake bison sed gettext gawk ncurses cmake \
	file flex attr acl libarchive e2fsprogs m4 perl libtool git \
	coreutils
#grep tar findutils patch util-linux less procps

#KBS - KaNaPi Base System
kbs: gzip cgdb mc vim openssh gpm

native_gcc: gcc

sdl-support: SDL_image

x-support: kbproto xproto xextproto libxcb xtrans inputproto libX11 libXext \
	util-macros fixesproto libXfixes libXdamage xf86driproto xcmiscproto \
	bigreqsproto randrproto renderproto fontsproto videoproto compositeproto \
	recordproto scrnsaverproto resourceproto xineramaproto xf86dgaproto \
	xf86vidmodeproto dri2proto dri3proto glproto presentproto pixman libxkbfile \
	freetype font-util libfontenc libXfont expat xkeyboard-config xkbcomp mkfontscale \
	mkfontdir bdftopcf font-cursor-misc libpciaccess libdrm libxshmfence pci_ids \
	cacert libusb usbutils udev llvm mesa xcb-util-keysyms xinit libICE libSM \
	libXt libXmu libXpm libXaw xterm libevdev mtdev xorg-server xf86-input-keyboard \
	xf86-input-mouse xf86-input-evdev xf86-video-intel xf86-video-vesa

tests: xflame water

linux:
	@$(RUN_TARGET)

glibc: linux
	@$(RUN_TARGET)

cross_gcc: glibc
	@$(RUN_TARGET)

#native compilers
gmp:
	@$(RUN_TARGET)

mpfr: gmp
	@$(RUN_TARGET)

mpc: mpfr
	@$(RUN_TARGET)

binutils: mpc
	@$(RUN_TARGET)

gcc: binutils
	@$(RUN_TARGET)

# PACKAGES

zlib:
	@$(RUN_TARGET)

libffi:
	@$(RUN_TARGET)

glib: libffi zlib
	@$(RUN_TARGET)

pkg-config: glib
	@$(RUN_TARGET)

cross-pkg-config: pkg-config
	@$(RUN_TARGET)

rootfs: cross-pkg-config
	@$(RUN_TARGET)

gzip:
	@$(RUN_TARGET)

bash:
	@$(RUN_TARGET)

busybox:
	@$(RUN_TARGET)

ncurses:
	@$(RUN_TARGET)

gdb:
	@$(RUN_TARGET)

readline:
	@$(RUN_TARGET)

cgdb: readline gdb
	@$(RUN_TARGET)

libgpg-error:
	@$(RUN_TARGET)

libgcrypt: libgpg-error
	@$(RUN_TARGET)

libssh2: libgcrypt
	@$(RUN_TARGET)

slang: zlib
	@$(RUN_TARGET)

mc: libssh2 slang glib
	@$(RUN_TARGET)

vim: 
	@$(RUN_TARGET)

make:
	@$(RUN_TARGET)

git:
	@$(RUN_TARGET)

openssl:
	@$(RUN_TARGET)

openssh: openssl
	@$(RUN_TARGET)

SDL:
	@$(RUN_TARGET)

xflame: SDL
	@$(RUN_TARGET)

water: SDL
	@$(RUN_TARGET)

libpng:
	@$(RUN_TARGET)

SDL_image: libpng SDL
	@$(RUN_TARGET)

#SDL2:
#	@$(RUN_TARGET)

gpm:
	@$(RUN_TARGET)

autoconf:
	@$(RUN_TARGET)

automake:
	@$(RUN_TARGET)

bison:	
	@$(RUN_TARGET)

sed:	
	@$(RUN_TARGET)

gettext:
	@$(RUN_TARGET)

gawk:
	@$(RUN_TARGET)

cmake:
	@$(RUN_TARGET)

file:
	@$(RUN_TARGET)

flex:
	@$(RUN_TARGET)

attr:
	@$(RUN_TARGET)

acl:
	@$(RUN_TARGET)

libarchive:
	@$(RUN_TARGET)

e2fsprogs:
	@$(RUN_TARGET)

m4:
	@$(RUN_TARGET)

perl:
	@$(RUN_TARGET)

libtool:
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

libxkbfile:
	@$(RUN_TARGET)

freetype: libpng
	@$(RUN_TARGET)

font-util:
	@$(RUN_TARGET)

libfontenc: font-util
	@$(RUN_TARGET)

libXfont: 
	@$(RUN_TARGET)

XML-Parser:
	@$(RUN_TARGET)

intltool: XML-Parser
	@$(RUN_TARGET)

libxml2:
	@$(RUN_TARGET)

libxslt: libxml2
	@$(RUN_TARGET)

xkeyboard-config: intltool libxslt
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

libpciaccess:
	@$(RUN_TARGET)

libdrm: libpciaccess
	@$(RUN_TARGET)

libxshmfence:
	@$(RUN_TARGET)

pci_ids:
	@$(RUN_TARGET)

cacert:
	@$(RUN_TARGET)

libusb:
	@$(RUN_TARGET)

usbutils: libusb zlib
	@$(RUN_TARGET)

udev: pci_ids usbutils
	@$(RUN_TARGET)

expat:
	@$(RUN_TARGET)

llvm:
	@$(RUN_TARGET)

mesa: libxshmfence udev expat llvm
	@$(RUN_TARGET)

xcb-util-keysyms:
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

xterm: libXext libxcb libXau libXpm libX11 
	@$(RUN_TARGET)

libevdev:
	@$(RUN_TARGET)

mtdev:
	@$(RUN_TARGET)

xorg-server: dri3proto dri2proto xf86driproto libxcb xcb-util-keysyms llvm
	@$(RUN_TARGET)

xf86-input-keyboard: xorg-server xproto inputproto
	@$(RUN_TARGET)

xf86-input-mouse: xorg-server xproto inputproto
	@$(RUN_TARGET)

xf86-input-evdev: mtdev libevdev udev xorg-server xproto inputproto
	@$(RUN_TARGET)

xf86-video-intel: libXfont freetype libpng libfontenc xorg-server xproto fontsproto pixman
	@$(RUN_TARGET)

xf86-video-vesa: xorg-server
	@$(RUN_TARGET)

coreutils:
	@$(RUN_TARGET)

#download version prepare install clean test:
#	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

help:	
	make kanapi_help

