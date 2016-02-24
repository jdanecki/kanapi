include ../scripts/config.kanapi
include ../scripts/rules.kanapi

PKGS=binutils gmp

all: $(PKGS)

# PACKAGES

binutils:
	@$(RUN_TARGET)

gmp:
	@$(RUN_TARGET)

download version prepare configure build install rebuild check clean:
	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

