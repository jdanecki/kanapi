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

download version prepare configure build install rebuild check clean:
	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

