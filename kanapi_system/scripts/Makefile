ifeq (x$(TOP),x)
BASE=
else
BASE=$(TOP)/
endif
include $(BASE)../../cross-compilers/scripts/config.kanapi
include $(BASE)../scripts/config.kanapi
include $(BASE)../scripts/rules.kanapi

PKGS=gzip

all: $(PKGS)

# PACKAGES

gzip:
	@$(RUN_TARGET)

download version prepare install clean test:
	$(foreach pkg,$(PKGS), make $(pkg) ACTION=$@; )

help:	
	make kanapi_help

