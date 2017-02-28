# 'test-sbs', 'bbs', 'rebuild', 'install'  targets were prepared for Jenkins config

all test test-sbs bbs rebuild install:
	make -C ci-tests $@
