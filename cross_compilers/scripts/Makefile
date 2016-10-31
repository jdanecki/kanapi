ifeq (x$(TOP),x)
BASE=
else
BASE=$(TOP)/
endif
include $(BASE)../scripts/config.kanapi
include $(BASE)../scripts/rules.kanapi

PKGS=libstdcpp

all: $(PKGS)

# PACKAGES

binutils:
	@$(RUN_TARGET)

gmp: binutils
	@$(RUN_TARGET)

mpfr: gmp
	@$(RUN_TARGET)

mpc: mpfr
	@$(RUN_TARGET)

gcc: mpc
	@$(RUN_TARGET)

linux: gcc
	@$(RUN_TARGET)

glibc: gcc
	@$(RUN_TARGET)

libstdcpp: gcc
	@$(RUN_TARGET)

pakiet1:
	@$(RUN_TARGET)

pakiet2: pakiet1
	@$(RUN_TARGET)

download version prepare install clean test:
	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

help:	
	make kanapi_help

