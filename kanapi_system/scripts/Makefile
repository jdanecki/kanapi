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

include ${BASE}../scripts/Makefile-sbs
include ${BASE}../scripts/Makefile-bbs
include ${BASE}../scripts/Makefile-cli
include ${BASE}../scripts/Makefile-x11

all: required optional

required: $(COMPILERS) rootfs bbs

optional: apps_txt devel sound graphics x-support sdl-support wm xapp tests apps_gui apps_gtk apps_gtk3 \
	sound_devel apps_qt www database nfs video sdl2-support graphics-apps ogl ocl network game_engine \
	demo

t_gui:  gtk+ dconf gtk3+ qt-everywhere-opensource-src 

t_editor_gui: xedit gvim evince qt-creator vym 
 
t_math: bc xcalc

t_media: t_editor_gui rplay graphics sdl-support gimp pavucontrol sound_devel qjackctl csoundqt musescore video \
	sdl2-support  graphics-apps ogl ocl game_engine www libmikmod

t_music: sound_devel csoundqt musescore

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

#KS - KaNaPi System gui apps
apps_gui: qemu

apps_gtk: gtk+ dconf gimp gvim

apps_gtk3: gtk3+ evince pavucontrol

sdl-support: SDL_image SDL_gfx SDL_ttf SDL_mixer GUIlib SDL-widgets

sdl2-support: SDL2_image SDL2_gfx SDL2_ttf SDL2_net SDL2_mixer

sound_devel: csound

tests: xflame water xclipboard intel-gpu-tools ltp-full hello phoronix-test-suite gperf


video: Blue mpv libmad

deprecated: procps ratpoison vtwm

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
# PACKAGES
#
linux:
	@$(RUN_TARGET)

SDL-fb:
	@$(RUN_TARGET)

SDL_image: libpng SDL
	@$(RUN_TARGET)

SDL2:
	@$(RUN_TARGET)

dtc:
	@$(RUN_TARGET)

SDL: xorg-server esound
	@$(RUN_TARGET)

cairo-demos: cairo 
	@$(RUN_TARGET)

procps:
	@$(RUN_TARGET)

intel-gpu-tools: kmod  libunwind libxcb 
	@$(RUN_TARGET)

xclipboard:
	@$(RUN_TARGET)

ifeq ($(KANAPI_TARGET),arm)
xflame water qemu gimp apps_qt www:
	true
else
www: webkitgtk midori php firefox

apps_qt: qt-everywhere-opensource-src qt-creator vym qjackctl csoundqt musescore

gimp: babl gegl dbus-glib
	@$(RUN_TARGET)

qemu: dtc
	@$(RUN_TARGET)

xflame: SDL
	@$(RUN_TARGET)

water: SDL
	@$(RUN_TARGET)
endif

atk:
	@$(RUN_TARGET)

gtk+: pango atk gdk-pixbuf adwaita-icon-theme
	@$(RUN_TARGET)

gdk-pixbuf: 
	@$(RUN_TARGET)

babl:
	@$(RUN_TARGET)

gegl: json-glib 
	@$(RUN_TARGET)

json-glib:
	@$(RUN_TARGET)

gvim:
	@$(RUN_TARGET)

libsoup:
	@$(RUN_TARGET)

glib-networking:
	@$(RUN_TARGET)

libXcomposite:
	@$(RUN_TARGET)

webkitgtk: libwebp libsoup libXcomposite gperf ruby gnutls glib-networking
	@$(RUN_TARGET)

gperf:
	@$(RUN_TARGET)

ruby:
	@$(RUN_TARGET)

gtk3+: libepoxy gsettings-desktop-schemas
	@$(RUN_TARGET)

libepoxy:
	@$(RUN_TARGET)

libwebp: libpng
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

midori: gcr
	@$(RUN_TARGET)

gcr: p11-kit
	@$(RUN_TARGET)

p11-kit:
	@$(RUN_TARGET)

dbus-glib: dbus
	@$(RUN_TARGET)

nasm:
	@$(RUN_TARGET)

evince: poppler itstool shared-mime-info
	@$(RUN_TARGET)

poppler:
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

linux-firmware:
	@$(RUN_TARGET)

SDL_gfx:
	@$(RUN_TARGET)

SDL_ttf:
	@$(RUN_TARGET)

ltp-full: expect
	@$(RUN_TARGET)

expect:
	@$(RUN_TARGET)

hello:
	@$(RUN_TARGET)

php: db gdbm
	@$(RUN_TARGET)

phoronix-test-suite: php
	@$(RUN_TARGET)

package-test:
	@$(RUN_TARGET)

SDL_mixer:
	@$(RUN_TARGET)

MPlayer: yasm
	@$(RUN_TARGET)

Blue: MPlayer
	@$(RUN_TARGET)

qiv: imlib2 libexif
	@$(RUN_TARGET)

libexif:
	@$(RUN_TARGET)

exif: libexif popt
	@$(RUN_TARGET)

popt:
	@$(RUN_TARGET)

firefox: autoconf213 yasm
	@$(RUN_TARGET)

autoconf213:
	DIR_NAME=autoconf-2.13; if [ ! -d  $${DIR_NAME} ]; then mkdir -p $${DIR_NAME} ; ln -svf ../../packages/$${DIR_NAME}/autoconf.kanapi $${DIR_NAME}; fi
	make -f ../Makefile -C autoconf-2.13 kanapi_$(ACTION) PKG=autoconf KANAPI_TOP=$(PWD) V=$(V)

ffmpeg: x264 gnutls
	@$(RUN_TARGET)

x264:
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

SDL2_image: libwebp SDL2
	@$(RUN_TARGET)

gcc_5:
	@$(RUN_TARGET_VER)

gcc_6:
	@$(RUN_TARGET_VER)

gcc_7:
	@$(RUN_TARGET_VER)

compilers: binutils gcc_5 gcc_6 gcc_7

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

fltk:
	@$(RUN_TARGET)

SDL2_ttf:
	@$(RUN_TARGET)

GUIlib:
	@$(RUN_TARGET)

SDL-widgets:
	@$(RUN_TARGET)

SDL2_gfx:
	@$(RUN_TARGET)

SDL2_mixer:
	@$(RUN_TARGET)

ClanLib:
	@$(RUN_TARGET)

allegro:
	@$(RUN_TARGET)

libmikmod:
	@$(RUN_TARGET)

mesa-demos: glew
	@$(RUN_TARGET)

glew: mesa
	@$(RUN_TARGET)

libmad:
	@$(RUN_TARGET)

SDL2_net:
	@$(RUN_TARGET)

physfs:
	@$(RUN_TARGET)

bullet3:
	@$(RUN_TARGET)

ogre:
	@$(RUN_TARGET)

musescore: lame libsndfile portaudio
	@$(RUN_TARGET)

lame:
	@$(RUN_TARGET)
