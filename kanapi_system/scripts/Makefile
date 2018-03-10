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
include $(BASE)../scripts/colors.kanapi
include $(BASE)../scripts/rules.kanapi
KANAPI_VER=$(shell cat  $(BASE)../scripts/KANAPI_VER)
CURRENT_ARCH=$(shell uname -m)
COMPILERS=cross_gcc
KANAPI_BASE=/kanapi_$(KANAPI_VER)/$(CURRENT_ARCH)/packages

ifeq ($(KANAPI_TARGET),$(CURRENT_ARCH))
COMPILERS+=gcc
endif

ifeq ($(CURRENT_ARCH),x86_64)
ifeq ($(KANAPI_TARGET),i686)
	DISABLE_PACKAGES=1
else
	DISABLE_PACKAGES=0
endif
endif

all: required optional

required: $(COMPILERS) rootfs bbs

minimal: $(COMPILERS) rootfs file busybox bash make openssl curl

optional: apps_txt devel sound graphics x-support sdl-support wm xapp tests apps_gui apps_gtk apps_gtk3 \
	sound_devel apps_qt www database nfs video sdl2-support graphics-apps ogl ocl network game_engine \
	demo

all-sbs: bbs-sbs

t_core: t_compression t_gui patchelf

t_core_cli: t_compression patchelf t_system t_devel vim bc rplay sound 

t_compression: gzip unrar bzip2 tar zip zlib

t_gui: x-support wm xapp gtk+ dconf gtk3+ qt-everywhere-opensource-src 

t_system: t_compression mc kmod procps-ng pciutils screen sdparm iotop ntfs-3g_ntfsprogs strace ltrace syslinux mbr nfs \
	wireless_tools wpa_supplicant dhcp wget network

t_devel: cgdb ctags chrpath vala makefile2graph scons lua database 

t_editor: vim xedit gvim evince qt-creator vym 
 
t_math: bc xcalc

t_media: rplay sound graphics sdl-support gimp pavucontrol sound_devel qjackctl csoundqt musescore video \
	sdl2-support  graphics-apps ogl ocl game_engine

t_music: sound sound_devel csoundqt musescore

t_tests: tests demo t_emulation

t_emulation: qemu

test-sbs: hello

graph: required_graph optional_graph

required_graph:
	unset LANG; unset LC_ALL; make -Bnd required ACTION=download V=1 | make2graph -r > required.dot
	#| dot -Tpdf -o required.pdf

optional_graph:
	unset LANG; unset LC_ALL; make -Bnd optional ACTION=download V=1 | make2graph -r > optional.dot
	#| dot -Tpdf -o optional.pdf

#Basic Build System 
bbs: file ccache busybox bash-completion make perl m4 autoconf automake libtool bison sed gettext ncurses readline gawk openssl cmake \
	flex attr acl libarchive e2fsprogs git \
	coreutils diffutils Python ninja tar findutils patch slang util-linux less openssh mtools

bbs-sbs: file ccache bash-completion m4 perl autoconf automake libtool bison sed gettext ncurses readline gawk cmake \
	flex attr acl libarchive e2fsprogs git \
	coreutils diffutils Python ninja tar findutils patch slang util-linux less openssh mtools


#KS - KaNaPi System textmode apps
apps_txt: gzip mc vim kmod procps-ng bc pciutils wireless_tools wpa_supplicant dhcp screen sdparm iotop wget rplay \
	ntfs-3g_ntfsprogs unrar

devel: cgdb strace ltrace ctags chrpath patchelf vala syslinux mbr makefile2graph scons lua

#KS - KaNaPi System gui apps
apps_gui: qemu

apps_gtk: gtk+ dconf gimp gvim

apps_gtk3: gtk3+ evince pavucontrol

sdl-support: SDL_image SDL_gfx SDL_ttf SDL_mixer GUIlib

sdl2-support: SDL2_image SDL2_gfx SDL2_ttf SDL2_net SDL2_mixer

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
	xf86-video-modesetting fonts setxkbmap xinput libXft icons libXxf86vm libXScrnSaver ois

fonts: fonts-bitmap fonts-type1 fonts-misc fonts-ttf
#	for i in 100dpi 75dpi Speedo Type1 cyrillic misc; do ln -svf $(KANAPI_BASE)/font-util-$(font_util_ver)/share/fonts/X11/$$i $(KANAPI_BASE)/fontconfig-$(fontconfig_ver)/share/fonts ; done
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

fonts-ttf: freefont-ttf dejavu-fonts-ttf font-bh-ttf
	
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
   xsetpointer xvinfo xauth tk graphviz groff netpbm xwd xwininfo feh xlunch

icons:  xcursor-themes default-icon-theme hicolor-icon-theme tango-icon-theme 

sound: alsa-utils esound gstreamer jack2 pulseaudio alsa-plugins speex sndio fluidsynth libmodplug flac openal-soft portaudio

sound_devel: csound

database: db gdbm

tests: xflame water xclipboard intel-gpu-tools ltp-full hello phoronix-test-suite

graphics: tiff jpegsrc freeimage

video: Blue mpv libmad

deprecated: procps

nfs: nfs-utils

graphics-apps: qiv opencv exif

demo: cairo-demos mesa-demos

game_engine: ClanLib allegro physfs bullet3 ogre 

#download version prepare install clean test:
#	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

help:	
	make kanapi_help
#
#for tests only
#

packages: package3

package1:
	@$(RUN_TARGET)

package4:
	@$(RUN_TARGET)

package2: package1
	@$(RUN_TARGET)

package3: package2 package4
	@$(RUN_TARGET)

#
# kernel, glibc, compilers
#
linux-headers:
	@$(RUN_TARGET)

linux:
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

slang: ncurses5
	@$(RUN_TARGET)

mc: libssh2 glib gpm
	@$(RUN_TARGET)

vim:
	@$(RUN_TARGET)

make:
	@$(RUN_TARGET)

git: curl 
	@$(RUN_TARGET)

openssl: 
	@$(RUN_TARGET)

openssh:
	@$(RUN_TARGET)

SDL-fb:
	@$(RUN_TARGET)

libpng:
	@$(RUN_TARGET)

SDL_image: libpng SDL
	@$(RUN_TARGET)

SDL2:
	@$(RUN_TARGET)

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

intltool: expat XML-Parser 
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

usbutils: libusb
	@$(RUN_TARGET)

udev: pci_ids usbutils
	@$(RUN_TARGET)

expat:
	@$(RUN_TARGET)

ifeq ($(KANAPI_TARGET),arm)
llvm_ver=$(llvm3_3_ver)
endif	

llvm: ninja
	@$(RUN_TARGET)


mesa: libxshmfence udev expat llvm wayland-protocols libva libunwind
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

ImageMagick: pango jpegsrc tiff
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

curl: libssh2
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

ifeq ($(KANAPI_TARGET),arm)
tcl tk graphviz swig groff xflame water qemu gimp apps_qt www:
	true
else
www: webkitgtk midori php

apps_qt: qt-everywhere-opensource-src qt-creator vym qjackctl csoundqt musescore

gimp: babl gegl dbus-glib
	@$(RUN_TARGET)

qemu: dtc
	@$(RUN_TARGET)

xflame: SDL
	@$(RUN_TARGET)

water: SDL
	@$(RUN_TARGET)

tcl:
	@$(RUN_TARGET)

tk: tcl
	@$(RUN_TARGET)

graphviz: swig
	@$(RUN_TARGET)

swig:
	@$(RUN_TARGET)

groff:
	@$(RUN_TARGET)
endif

xauth:
	@$(RUN_TARGET)

bc:
	@$(RUN_TARGET)

atk:
	@$(RUN_TARGET)

gtk+: pango atk gdk-pixbuf adwaita-icon-theme
	@$(RUN_TARGET)

gdk-pixbuf: jpegsrc
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

nettle: gmp
	@$(RUN_TARGET)

gtk3+: libepoxy gsettings-desktop-schemas
	@$(RUN_TARGET)

harfbuzz: cairo icu4c
	@$(RUN_TARGET)

libepoxy:
	@$(RUN_TARGET)

chrpath:
	@$(RUN_TARGET)

patchelf:
	@$(RUN_TARGET)

libwebp: libpng jpegsrc
	@$(RUN_TARGET)

adwaita-icon-theme: librsvg
	@$(RUN_TARGET)

librsvg: libcroco
	@$(RUN_TARGET)

libcroco:
	@$(RUN_TARGET)

qt-everywhere-opensource-src: alsa-lib dbus
	@$(RUN_TARGET)

dbus:
	@$(RUN_TARGET)

qt-creator:
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

netpbm: libpng14 jpegsrc
	@$(RUN_TARGET)

libpng14:
	@$(RUN_TARGET)

syslinux: nasm
	@$(RUN_TARGET)

nasm:
	@$(RUN_TARGET)

feh: imlib2
	@$(RUN_TARGET)

imlib2: tiff
	@$(RUN_TARGET)

evince: poppler itstool shared-mime-info
	@$(RUN_TARGET)

poppler: jpegsrc
	@$(RUN_TARGET)

itstool:
	@$(RUN_TARGET)

#lxml:
#	@$(RUN_TARGET)

gsettings-desktop-schemas:
	@$(RUN_TARGET)

dconf:
	@$(RUN_TARGET)

shared-mime-info:
	@$(RUN_TARGET)

vym: zip
	@$(RUN_TARGET)

makefile2graph:
	@$(RUN_TARGET)

wireless_tools:
	@$(RUN_TARGET)

wpa_supplicant: libnl
	@$(RUN_TARGET)

libnl:
	@$(RUN_TARGET)

ifeq ($(DISABLE_PACKAGES),1)
dhcp mbr bin86:
	true
else
dhcp:
	@$(RUN_TARGET)

mbr: bin86
	@$(RUN_TARGET)

bin86:
	@$(RUN_TARGET)
endif

xlunch:
	@$(RUN_TARGET)

zip:
	@$(RUN_TARGET)

screen:
	@$(RUN_TARGET)

sdparm:
	@$(RUN_TARGET)

linux-firmware:
	@$(RUN_TARGET)

SDL_gfx:
	@$(RUN_TARGET)

SDL_ttf:
	@$(RUN_TARGET)

ltp-full: expect
	@$(RUN_TARGET)

expect: tcl
	@$(RUN_TARGET)

iotop:
	@$(RUN_TARGET)

bash-completion: bash
	@$(RUN_TARGET)

mtools:
	@$(RUN_TARGET)

hello:
	@$(RUN_TARGET)

db:
	@$(RUN_TARGET)

gdbm:
	@$(RUN_TARGET)

php: db gdbm
	@$(RUN_TARGET)

phoronix-test-suite: php
	@$(RUN_TARGET)

wget: gnutls
	@$(RUN_TARGET)

font-bh-ttf:
	@$(RUN_TARGET)

package-test:
	@$(RUN_TARGET)

rplay:
	@$(RUN_TARGET)

tiff:
	@$(RUN_TARGET)

SDL_mixer:
	@$(RUN_TARGET)

ntfs-3g_ntfsprogs:
	@$(RUN_TARGET)

MPlayer: yasm
	@$(RUN_TARGET)

Blue: MPlayer
	@$(RUN_TARGET)

qiv: imlib2 jpegsrc libexif
	@$(RUN_TARGET)

libexif:
	@$(RUN_TARGET)

exif: libexif popt
	@$(RUN_TARGET)

popt:
	@$(RUN_TARGET)

unrar:
	@$(RUN_TARGET)

nfs-utils: rpcbind libevent libnfsidmap
	@$(RUN_TARGET)

rpcbind: libtirpc
	@$(RUN_TARGET)

libtirpc:
	@$(RUN_TARGET)

libevent:
	@$(RUN_TARGET)

libnfsidmap:
	@$(RUN_TARGET)

firefox: autoconf213 yasm
	@$(RUN_TARGET)

autoconf213:
	DIR_NAME=autoconf-2.13; if [ ! -d  $${DIR_NAME} ]; then mkdir $${DIR_NAME} ; ln -svf ../../packages/$${DIR_NAME}/autoconf.kanapi $${DIR_NAME}; fi
	make -f ../Makefile -C autoconf-2.13 kanapi_$(ACTION) PKG=autoconf KANAPI_TOP=$(PWD) V=$(V)


ffmpeg: x264 gnutls
	@$(RUN_TARGET)

x264:
	@$(RUN_TARGET)

libva: libdrm
	@$(RUN_TARGET)

libva-intel-driver: libva
	@$(RUN_TARGET)

mpv: libva-intel-driver ffmpeg
	@$(RUN_TARGET)

yasm:
	@$(RUN_TARGET)

rtl8188eu:
	@$(RUN_TARGET)

beignet: ocl-icd
	@$(RUN_TARGET)

ocl-icd: ruby
	@$(RUN_TARGET)

clinfo:
	@$(RUN_TARGET)

clpeak:
	@$(RUN_TARGET)

glu:
	@$(RUN_TARGET)

freeglut: glu
	@$(RUN_TARGET)

ogl: freeglut

ocl: beignet clinfo clpeak

opencv:
	@$(RUN_TARGET)

SDL2_image: tiff libwebp SDL2
	@$(RUN_TARGET)

iproute2:
	@$(RUN_TARGET)

network: iproute2 enet

gstreamer: libunwind
	@$(RUN_TARGET)

jack2:
	@$(RUN_TARGET)

pulseaudio: libsndfile speexdsp intltool
	@$(RUN_TARGET)

libsndfile: libvorbis
	@$(RUN_TARGET)

speex:
	@$(RUN_TARGET)

speexdsp:
	@$(RUN_TARGET)

gcc_5:
	@$(RUN_TARGET_VER)

gcc_6:
	@$(RUN_TARGET_VER)

gcc_7:
	@$(RUN_TARGET_VER)

compilers: binutils gcc_5 gcc_6 gcc_7

scons:
	@$(RUN_TARGET)

csound: fltk
	@$(RUN_TARGET)

csoundqt: csound
	@$(RUN_TARGET)

qjackctl:
	@$(RUN_TARGET)

pavucontrol: libsigcpp gtkmm libcanberra
	@$(RUN_TARGET)

libsigcpp:
	@$(RUN_TARGET)

gtkmm: libsigcpp atkmm pangomm
	@$(RUN_TARGET)

atkmm: glibmm
	@$(RUN_TARGET)

glibmm:
	@$(RUN_TARGET)

pangomm: cairomm
	@$(RUN_TARGET)

cairomm:
	@$(RUN_TARGET)

libcanberra: libvorbis
	@$(RUN_TARGET)

libvorbis: libogg
	@$(RUN_TARGET)

libogg:
	@$(RUN_TARGET)

fltk:
	@$(RUN_TARGET)

SDL2_ttf:
	@$(RUN_TARGET)

GUIlib:
	@$(RUN_TARGET)

SDL-widgets:
	@$(RUN_TARGET)

alsa-plugins:
	@$(RUN_TARGET)

SDL2_gfx:
	@$(RUN_TARGET)

SDL2_mixer:
	@$(RUN_TARGET)

xf86-video-s3:
	@$(RUN_TARGET)

xf86-video-tseng:
	@$(RUN_TARGET)

ClanLib:
	@$(RUN_TARGET)

allegro:
	@$(RUN_TARGET)

Hermes:
	@$(RUN_TARGET)

libmikmod:
	@$(RUN_TARGET)

libXxf86vm:
	@$(RUN_TARGET)

sndio:
	@$(RUN_TARGET)

libXScrnSaver:
	@$(RUN_TARGET)

fluidsynth:
	@$(RUN_TARGET)

wayland-protocols: wayland
	@$(RUN_TARGET)

wayland:
	@$(RUN_TARGET)

mesa-demos: glew
	@$(RUN_TARGET)

glew: mesa
	@$(RUN_TARGET)

lua:
	@$(RUN_TARGET)

libmad:
	@$(RUN_TARGET)

libmodplug:
	@$(RUN_TARGET)

SDL2_net:
	@$(RUN_TARGET)

physfs:
	@$(RUN_TARGET)

bullet3:
	@$(RUN_TARGET)

ogre:
	@$(RUN_TARGET)

freeimage:
	@$(RUN_TARGET)

ois:
	@$(RUN_TARGET)

enet:
	@$(RUN_TARGET)

flac:
	@$(RUN_TARGET)

openal-soft:
	@$(RUN_TARGET)

portaudio:
	@$(RUN_TARGET)

musescore: lame libsndfile portaudio
	@$(RUN_TARGET)

lame:
	@$(RUN_TARGET)
