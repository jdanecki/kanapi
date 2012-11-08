DIRS0="diffutils gzip bzip2 linux net-tools wget Python libffi glib pkg-config pixman kbproto strace xproto \
xextproto xtrans libxml2 libxslt xcb-proto libpthread-stubs libXau libxcb inputproto util-macros libX11 \
glproto makedepend libpciaccess libdrm dri2proto libXext damageproto fixesproto libXfixes libXdamage \
expat groff llvm MesaLib xf86driproto openssl xcmiscproto bigreqsproto randrproto renderproto fontsproto \
videoproto compositeproto recordproto scrnsaverproto resourceproto xineramaproto libxkbfile freetype libfontenc \
libXfont xorg-server perl xinit libICE libSM libXt libXmu libXpm libXaw xterm xf86-input-keyboard xf86-input-mouse \
xf86-video-vesa xf86-video-fbdev XML-Parser intltool xkbcomp xkeyboard-config mkfontdir bdftopcf mkfontscale \
font-cursor-misc font-util xorg-cf-files imake rplay vtwm atk fontconfig libpng cairo tiff libjpeg \
gdk-pixbuf libXrender pango gtk+ libxfce4util dbus-glib dbus ExtUtils-Depends ExtUtils-PkgConfig Glib \
xfconf libxfceui libwnck xfwm4 garcon URI exo xfce4-panel xfdesktop procps"

DIRS1="diffutils"

DIRS=$(DIRS1)

prepare: check1 copy

copy:
	@cp Makefile kanapi_system/kanapi_build/out
	@for d in "$(DIRS)" ; do \
		cd scripts/$${d} ; ./prepare  ; cd ../.. ; \
	done

check1:
	@for d in "$(DIRS)" ; do \
		if ! test -f "scripts/$${d}/prepare"  ; then echo "$${d} missing" ; fi \
	done

compile: 
	@for d in "$(DIRS)" ; do \
		cd $${d}-* ; ./$${d}-*.compile ; cd .. ; \
	done


