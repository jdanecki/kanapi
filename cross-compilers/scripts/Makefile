ifeq (x$(TOP),x)
BASE=
else
BASE=$(TOP)/
endif
include $(BASE)../scripts/config.kanapi
include $(BASE)../scripts/rules.kanapi

PKGS=binutils gcc linux

all: $(PKGS)

# PACKAGES

binutils:
	@$(RUN_TARGET)

gmp:
	@$(RUN_TARGET)

mpfr: gmp
	@$(RUN_TARGET)

mpc: mpfr
	@$(RUN_TARGET)

gcc: mpc
	@$(RUN_TARGET)

pakiet1:
	@$(RUN_TARGET)

pakiet2: pakiet1
	@$(RUN_TARGET)

	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

