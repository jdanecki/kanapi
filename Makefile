# 'test-sbs', 'bbs', 'rebuild', 'install'  targets were prepared for Jenkins config

all test test-sbs bbs bbs_sbs rebuild install:
	make -C ci-tests $@
