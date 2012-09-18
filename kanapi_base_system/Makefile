DIRS="diffutils gzip bzip2 linux net-tools wget python libffi glib pkg-config pixman kbproto strace xproto \
xextproto xtrans libxml2 libxslt xcb-proto libpthread-stubs libXau libxcb inputproto util-macros libX11 \
glproto makedepend libpciaccess libdrm dri2proto libXext damageproto fixesproto libXfixes libXdamage \
expat groff llvm MesaLib xf86driproto openssl xcmiscproto bigreqsproto randrproto renderproto fontsproto \
videoproto compositeproto recordproto scrnsaverproto resourceproto xineramaproto libxkbfile freetype libfontenc \
libXfont xorg-server perl"

prepare: check
	@for d in "$(DIRS)" ; do \
		cd scripts/$${d} ; ./prepare  ; cd ../.. ; \
	done

check:
	@for d in "$(DIRS)" ; do \
		if ! test -f "scripts/$${d}/prepare"  ; then echo "$${d} missing" ; fi \
	done

