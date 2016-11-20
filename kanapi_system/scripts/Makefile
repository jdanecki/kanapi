ifeq (x$(KANAPI_TOP),x)
BASE=
else
BASE=$(KANAPI_TOP)/
endif
include $(BASE)../../cross_compilers/scripts/config.kanapi
include $(BASE)../scripts/config.kanapi
include $(BASE)../scripts/config-Makefile.kanapi
include $(BASE)../scripts/rules.kanapi

PKGS=gzip bash busybox cgdb mc vim make git openssh sdl_image gpm
TESTS=xflame water

all: $(PKGS)

native_gcc: gcc

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

zlib: cross_gcc
	@$(RUN_TARGET)

libffi: cross_gcc
	@$(RUN_TARGET)

glib: libffi zlib
	@$(RUN_TARGET)

pkg-config: glib
	@$(RUN_TARGET)

cross-pkg-config: pkg-config
	@$(RUN_TARGET)

rootfs: cross-pkg-config
	@$(RUN_TARGET)

gzip: rootfs
	@$(RUN_TARGET)

bash:
	@$(RUN_TARGET)

busybox:
	@$(RUN_TARGET)

ncurses:
	@$(RUN_TARGET)

gdb: ncurses
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

vim: ncurses
	@$(RUN_TARGET)

make:
	@$(RUN_TARGET)

git:
	@$(RUN_TARGET)

openssl:
	@$(RUN_TARGET)

openssh: openssl
	@$(RUN_TARGET)

sdl:
	@$(RUN_TARGET)

xflame: sdl
	@$(RUN_TARGET)

water: sdl
	@$(RUN_TARGET)

libpng: zlib
	@$(RUN_TARGET)

sdl_image: libpng sdl
	@$(RUN_TARGET)

#sdl2:
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

download version prepare install clean test:
	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

help:	
	make kanapi_help

