KANAPI_ARCH_DIR=arm x86 x86_64

TARGET_BODY=$(foreach arch,$(KANAPI_ARCH_DIR), make -C $(arch) $@;)

all: install

download:
	$(TARGET_BODY)

prepare: download
	$(TARGET_BODY)

version: download
	$(TARGET_BODY)
   
install:
	$(TARGET_BODY)
   
clean:
	$(TARGET_BODY)
