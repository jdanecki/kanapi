ifeq (x$(KANAPI_TOP),x)
BASE=
include target_name
else
BASE=$(KANAPI_TOP)/
include $(BASE)target_name
endif
include $(BASE)../../cross_compilers/scripts/config.kanapi
include $(BASE)../scripts/config.kanapi
include $(BASE)../scripts/config-Makefile.kanapi
include $(BASE)../scripts/rules.kanapi
KANAPI_VER=$(shell cat  $(BASE)../scripts/KANAPI_VER)
CURRENT_ARCH=$(shell uname -m)
COMPILERS=cross_gcc
KANAPI_BASE=/kanapi_$(KANAPI_VER)/$(CURRENT_ARCH)/packages

ifeq ($(KANAPI_TARGET),$(CURRENT_ARCH))
COMPILERS+=gcc
endif

all: required optional

required: $(COMPILERS) rootfs bbs

optional: apps_txt devel sound x-support sdl-support wm xapp tests apps_gui apps_gtk apps_gtk3 \
	apps_qt www 

#Basic Build System 
bbs: ccache busybox bash make perl m4 autoconf automake grep libtool bison sed gettext ncurses readline gawk openssl cmake \
	file flex attr acl libarchive e2fsprogs git \
	coreutils diffutils Python ninja tar findutils patch slang util-linux less openssh

#KS - KaNaPi System textmode apps
apps_txt: gzip mc vim gpm kmod procps-ng bc pciutils

devel: cgdb strace ltrace ctags chrpath patchelf vala

#KS - KaNaPi System gui apps
apps_gui: qemu

apps_gtk: gtk+ gimp gvim

apps_gtk3: gtk3+

apps_qt: qt-everywhere-opensource-src qt-creator

sdl-support: SDL_image

x-support: kbproto util-macros xproto xextproto libxcb xtrans inputproto libX11 libXext \
	fixesproto libXfixes libXdamage xf86driproto xcmiscproto \
	bigreqsproto randrproto renderproto fontsproto videoproto compositeproto \
	recordproto scrnsaverproto resourceproto xineramaproto xf86dgaproto \
	xf86vidmodeproto dri2proto dri3proto glproto presentproto pixman libxkbfile \
	freetype font-util libfontenc libXfont expat xkeyboard-config xkbcomp mkfontscale \
	mkfontdir bdftopcf font-cursor-misc libpciaccess libdrm libxshmfence pci_ids \
	cacert libusb usbutils udev llvm mesa xcb-util-keysyms xinit libICE libSM \
	libXt libXmu libevdev mtdev xorg-server xf86-input-keyboard \
	xf86-input-mouse xf86-input-evdev xf86-video-intel xf86-video-vesa xf86-video-fbdev \
	xf86-video-modesetting fonts setxkbmap xinput libXft icons

fonts: fonts-bitmap fonts-type1 fonts-misc fonts-ttf
	for i in 100dpi 75dpi Speedo Type1 cyrillic misc; do ln -svf $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/$$i $(KANAPI_BASE)/fontconfig-$(fontconfig_ver)/share/fonts ; done
	if [ ! -d $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF ] ; then mkdir $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF; fi
	for i in $(KANAPI_BASE)/freefont-ttf-$(freefont_ttf_ver)/*.ttf $(KANAPI_BASE)/dejavu-fonts-ttf-$(dejavu_fonts_ttf_ver)/ttf/*.ttf ; do \
		ln -svf $$i $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF ; done
	echo -n > $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF/fonts
	for i in $(KANAPI_BASE)/freefont-ttf-$(freefont_ttf_ver)/fonts.scale $(KANAPI_BASE)/dejavu-fonts-ttf-$(dejavu_fonts_ttf_ver)/ttf/fonts.scale ; do \
		cat $$i | grep ttf >> $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF/fonts ; done
	cat $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF/fonts	| wc -l >  $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF/fonts.scale
	cat $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF/fonts	>>  $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF/fonts.scale
	rm $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF/fonts
	cd $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/TTF ; mkfontdir

fonts-ttf: freefont-ttf dejavu-fonts-ttf
	
fonts-bitmap: fonts-utopia fonts-bh fonts-bitstream
	
fonts-utopia: font-adobe-75dpi font-adobe-100dpi font-adobe-utopia-75dpi font-adobe-utopia-100dpi 
	
fonts-bh: font-bh-75dpi font-bh-100dpi font-bh-lucidatypewriter-75dpi font-bh-lucidatypewriter-100dpi

fonts-bitstream: font-bitstream-75dpi font-bitstream-100dpi font-bitstream-speedo 

fonts-type1: font-adobe-utopia-type1 font-bh-type1 font-ibm-type1 font-xfree86-type1 

fonts-misc: font-daewoo-misc font-dec-misc font-isas-misc font-jis-misc font-micro-misc font-misc-misc \
	font-mutt-misc font-schumacher-misc font-sony-misc font-sun-misc font-alias

wm:	vtwm ratpoison i3blocks

xapp: xfd st xterm bitmap oclock showfont x11perf xbacklight xcalc xclock xconsole xedit oneko xdriinfo \
   xdpyinfo xeyes xev xhost xkill xload xfontsel xmag xman xmodmap xrandr xset xsetroot \
   xsetpointer xvinfo xauth tk graphviz groff netpbm xwd xwininfo
	
icons:  xcursor-themes default-icon-theme hicolor-icon-theme tango-icon-theme 

sound: alsa-utils esound

www: webkitgtk midori

tests: xflame water xclipboard intel-gpu-tools

deprecated: procps

#download version prepare install clean test:
#	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

help:	
	make kanapi_help
#
#for tests only
#

packages: package1 package2

package1:
	@$(RUN_TARGET)

package2: package1
	@$(RUN_TARGET)

#
# kernel, glibc, compilers
#
linux-headers:
	@$(RUN_TARGET)

glibc: linux-headers
	@$(RUN_TARGET)

cross_gcc: glibc
	@$(RUN_TARGET)

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

#
# PACKAGES
#
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

ncurses5:
	@$(RUN_TARGET)

gdb:
	@$(RUN_TARGET)

readline:
	@$(RUN_TARGET)

cgdb: gdb
	@$(RUN_TARGET)

libgpg-error:
	@$(RUN_TARGET)

libgcrypt: libgpg-error
	@$(RUN_TARGET)

libssh2: libgcrypt
	@$(RUN_TARGET)

slang: zlib ncurses5
	@$(RUN_TARGET)

mc: libssh2 glib
	@$(RUN_TARGET)

vim:
	@$(RUN_TARGET)

make:
	@$(RUN_TARGET)

git: curl 
	@$(RUN_TARGET)

openssl: perl
	@$(RUN_TARGET)

openssh:
	@$(RUN_TARGET)

SDL-fb:
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

autoconf: perl m4
	@$(RUN_TARGET)

automake: perl
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

libtool: grep
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

libxml2: xz
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

llvm: ninja
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

xterm: libXext libxcb libXau libXpm libX11 libXrender
	@$(RUN_TARGET)

libevdev:
	@$(RUN_TARGET)

mtdev:
	@$(RUN_TARGET)

xorg-server: dri3proto dri2proto xf86driproto libxcb xcb-util-keysyms llvm libunwind
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

xf86-video-fbdev: xorg-server
	@$(RUN_TARGET)

coreutils:
	@$(RUN_TARGET)

dtc:
	@$(RUN_TARGET)

qemu: dtc
	@$(RUN_TARGET)

alsa-lib:
	@$(RUN_TARGET)

alsa-utils: alsa-lib
	@$(RUN_TARGET)

audiofile:
	@$(RUN_TARGET)

esound: audiofile alsa-lib
	@$(RUN_TARGET)

SDL: xorg-server esound
	@$(RUN_TARGET)

strace:
	@$(RUN_TARGET)

vtwm: libXpm
	@$(RUN_TARGET)

ratpoison:
	@$(RUN_TARGET)

libXft: libXrender
	@$(RUN_TARGET)

libXrender:
	@$(RUN_TARGET)

fontconfig: freetype
	@$(RUN_TARGET)

freefont-ttf: fontconfig
	@$(RUN_TARGET)

dejavu-fonts-ttf: fontconfig
	@$(RUN_TARGET)

xfd: libXaw
	@$(RUN_TARGET)

libXcursor: libXrender
	@$(RUN_TARGET)

libev:
	@$(RUN_TARGET)

startup-notification: xcb-util	
	@$(RUN_TARGET)

xcb-util:
	@$(RUN_TARGET)

xcb-util-renderutil:
	@$(RUN_TARGET)

xcb-util-image: libXau libxcb
	@$(RUN_TARGET)

xcb-util-cursor: xcb-util-renderutil xcb-util-image
	@$(RUN_TARGET)

xcb-util-wm:
	@$(RUN_TARGET)

xcb-util-xrm:
	@$(RUN_TARGET)

libxkbcommon:
	@$(RUN_TARGET)
yajl:
	@$(RUN_TARGET)

pcre:
	@$(RUN_TARGET)

cairo: 
	@$(RUN_TARGET)

cairo-demos: cairo 
	@$(RUN_TARGET)

pango: harfbuzz
	@$(RUN_TARGET)

i3: libev startup-notification xcb-util xcb-util-cursor xcb-util-wm xcb-util-xrm libxkbcommon yajl pcre pango
	@$(RUN_TARGET)

#i3status: i3
#	@$(RUN_TARGET)

i3blocks: dmenu i3 
	@$(RUN_TARGET)

st: fontconfig freetype
	@$(RUN_TARGET)

font-adobe-75dpi:
	@$(RUN_TARGET)

font-adobe-100dpi:
	@$(RUN_TARGET)

font-adobe-utopia-75dpi:
	@$(RUN_TARGET)

font-adobe-utopia-100dpi:
	@$(RUN_TARGET)

font-adobe-utopia-type1:
	@$(RUN_TARGET)

font-bh-75dpi:
	@$(RUN_TARGET)

font-bh-100dpi:
	@$(RUN_TARGET)

font-bh-lucidatypewriter-75dpi:
	@$(RUN_TARGET)

font-bh-lucidatypewriter-100dpi:
	@$(RUN_TARGET)

font-bh-type1:
	@$(RUN_TARGET)

font-bitstream-75dpi:
	@$(RUN_TARGET)

font-bitstream-100dpi:
	@$(RUN_TARGET)

font-bitstream-speedo:
	@$(RUN_TARGET)

font-daewoo-misc:
	@$(RUN_TARGET)

font-dec-misc:
	@$(RUN_TARGET)

font-ibm-type1:
	@$(RUN_TARGET)

font-isas-misc:
	@$(RUN_TARGET)

font-jis-misc:
	@$(RUN_TARGET)

font-micro-misc:
	@$(RUN_TARGET)

font-misc-misc:
	@$(RUN_TARGET)

font-mutt-misc:
	@$(RUN_TARGET)

font-schumacher-misc:
	@$(RUN_TARGET)

font-sony-misc:
	@$(RUN_TARGET)

font-sun-misc:
	@$(RUN_TARGET)

font-xfree86-type1:
	@$(RUN_TARGET)

font-alias:
	@$(RUN_TARGET)

xf86-video-modesetting: xorg-server
	@$(RUN_TARGET)

xbitmaps:
	@$(RUN_TARGET)

bitmap: xbitmaps
	@$(RUN_TARGET)

xz:
	@$(RUN_TARGET)

kmod: xz
	@$(RUN_TARGET)

procps:
	@$(RUN_TARGET)

procps-ng:
	@$(RUN_TARGET)

libunwind:
	@$(RUN_TARGET)

intel-gpu-tools: kmod procps-ng libunwind udev libpciaccess libxcb 
	@$(RUN_TARGET)

oclock:	
	@$(RUN_TARGET)

setxkbmap: xkbcomp
	@$(RUN_TARGET)

libFS:
	@$(RUN_TARGET)

showfont: libFS
	@$(RUN_TARGET)

x11perf:
	@$(RUN_TARGET)

xbacklight:
	@$(RUN_TARGET)

xcursorgen: libXcursor
	@$(RUN_TARGET)

xcursor-themes: xcursorgen
	@$(RUN_TARGET)

default-icon-theme:
	@$(RUN_TARGET)

hicolor-icon-theme:
	@$(RUN_TARGET)

XML-NamespaceSupport:
	@$(RUN_TARGET)

XML-SAX-Base:
	@$(RUN_TARGET)

XML-SAX: XML-NamespaceSupport XML-SAX-Base XML-Parser
	@$(RUN_TARGET)

XML-SAX-Expat: XML-SAX
	@$(RUN_TARGET)

XML-Simple: XML-SAX-Expat
	@$(RUN_TARGET)

icon-naming-utils: XML-Simple
	@$(RUN_TARGET)

ImageMagick: pango
	@$(RUN_TARGET)

tango-icon-theme: icon-naming-utils ImageMagick
	@$(RUN_TARGET)

xcalc:
	@$(RUN_TARGET)

xclock:
	@$(RUN_TARGET)

xconsole:
	@$(RUN_TARGET)

xedit:
	@$(RUN_TARGET)

xorg-cf-files:
	@$(RUN_TARGET)

imake: xorg-cf-files
	@$(RUN_TARGET)

oneko: imake
	@$(RUN_TARGET)

xdriinfo: mesa
	@$(RUN_TARGET)

xdpyinfo: libXtst libXrender
	@$(RUN_TARGET)

libXtst: libXi
	@$(RUN_TARGET)

libXi:
	@$(RUN_TARGET)

xeyes:
	@$(RUN_TARGET)

xev: libXrandr
	@$(RUN_TARGET)

libXrandr: libXrender
	@$(RUN_TARGET)

xhost:
	@$(RUN_TARGET)

xkill:
	@$(RUN_TARGET)

xload:
	@$(RUN_TARGET)

xfontsel:
	@$(RUN_TARGET)

dmenu:
	@$(RUN_TARGET)

re2c:
	@$(RUN_TARGET)

ninja: re2c
	@$(RUN_TARGET)

diffutils:
	@$(RUN_TARGET)

curl: openssl libssh2
	@$(RUN_TARGET)

grep:
	@$(RUN_TARGET)

tar:
	@$(RUN_TARGET)

findutils:
	@$(RUN_TARGET)

patch:
	@$(RUN_TARGET)

util-linux:
	@$(RUN_TARGET)

less:
	@$(RUN_TARGET)

xclipboard:
	@$(RUN_TARGET)

xinput: libXi libXrandr libXinerama
	@$(RUN_TARGET)

libXinerama:
	@$(RUN_TARGET)

sqlite-autoconf:
	@$(RUN_TARGET)

Python: sqlite-autoconf bzip2
	@$(RUN_TARGET)

bzip2:
	@$(RUN_TARGET)

ltrace: libelf
	@$(RUN_TARGET)

libelf:
	@$(RUN_TARGET)

ccache:
	@$(RUN_TARGET)

xmag:
	@$(RUN_TARGET)

xman:
	@$(RUN_TARGET)

xmodmap:
	@$(RUN_TARGET)

xrandr:
	@$(RUN_TARGET)

xset:
	@$(RUN_TARGET)

xsetroot:
	@$(RUN_TARGET)

xsetpointer:
	@$(RUN_TARGET)

xvinfo: libXv
	@$(RUN_TARGET)

libXv:
	@$(RUN_TARGET)

ctags:
	@$(RUN_TARGET)

tcl:
	@$(RUN_TARGET)

tk: tcl
	@$(RUN_TARGET)

xauth:
	@$(RUN_TARGET)

bc:
	@$(RUN_TARGET)

atk:
	@$(RUN_TARGET)

gtk+: pango atk gdk-pixbuf adwaita-icon-theme
	@$(RUN_TARGET)

gdk-pixbuf:
	@$(RUN_TARGET)

gimp: babl gegl dbus-glib
	@$(RUN_TARGET)

babl:
	@$(RUN_TARGET)

gegl: json-glib jpegsrc
	@$(RUN_TARGET)

json-glib:
	@$(RUN_TARGET)

jpegsrc:
	@$(RUN_TARGET)

gvim:
	@$(RUN_TARGET)

libsoup:
	@$(RUN_TARGET)

glib-networking:
	@$(RUN_TARGET)

icu4c:
	@$(RUN_TARGET)

libXcomposite:
	@$(RUN_TARGET)

webkitgtk: libwebp libsoup libXcomposite gperf ruby gnutls glib-networking
	@$(RUN_TARGET)

gperf:
	@$(RUN_TARGET)

ruby:
	@$(RUN_TARGET)

gnutls: nettle
	@$(RUN_TARGET)

nettle:
	@$(RUN_TARGET)

gtk3+: libepoxy
	@$(RUN_TARGET)

harfbuzz: cairo icu4c
	@$(RUN_TARGET)

libepoxy:
	@$(RUN_TARGET)

chrpath:
	@$(RUN_TARGET)

patchelf:
	@$(RUN_TARGET)

graphviz:
	@$(RUN_TARGET)

libwebp: libpng jpegsrc
	@$(RUN_TARGET)

adwaita-icon-theme: librsvg
	@$(RUN_TARGET)

librsvg: libcroco
	@$(RUN_TARGET)

libcroco:
	@$(RUN_TARGET)

qt-everywhere-opensource-src:
	@$(RUN_TARGET)

dbus:
	@$(RUN_TARGET)

qt-creator:
	@$(RUN_TARGET)

groff:
	@$(RUN_TARGET)

vala:
	@$(RUN_TARGET)

midori: gcr
	@$(RUN_TARGET)

gcr: p11-kit
	@$(RUN_TARGET)

p11-kit:
	@$(RUN_TARGET)

pciutils:
	@$(RUN_TARGET)

dbus-glib: dbus
	@$(RUN_TARGET)

xwd:
	@$(RUN_TARGET)

xwininfo:
	@$(RUN_TARGET)

netpbm: libpng14
	@$(RUN_TARGET)

libpng14:
	@$(RUN_TARGET)
