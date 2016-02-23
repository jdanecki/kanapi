KANAPI_ARCH_DIR=arm x86 x86_64

download version prepare configure build install rebuild check clean:
	$(foreach arch,$(KANAPI_ARCH_DIR), make -C $(arch) $@; )
