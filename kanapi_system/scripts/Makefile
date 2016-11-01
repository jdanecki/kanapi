ifeq (x$(TOP),x)
BASE=
else
BASE=$(TOP)/
endif
include $(BASE)../../cross_compilers/scripts/config.kanapi
include $(BASE)../scripts/config.kanapi
include $(BASE)../scripts/rules.kanapi

PKGS=gzip bash busybox gdb readline

all: $(PKGS)

compilers: linux glibc libstdcpp

linux:
	@$(RUN_TARGET)

glibc: linux
	@$(RUN_TARGET)

libstdcpp: glibc
	@$(RUN_TARGET)

gmp:
	@$(RUN_TARGET)

mpfr: gmp
	@$(RUN_TARGET)

mpc: mpfr
	@$(RUN_TARGET)

binutils: glibc
	@$(RUN_TARGET)

gcc: mpc
	@$(RUN_TARGET)

# PACKAGES

gzip:
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

download version prepare install clean test:
	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

help:	
	make kanapi_help

