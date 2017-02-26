# 'test-sbs', 'bbs', 'rebuild'  targets were prepared for Jenkins config

all test test-sbs bbs rebuild:
	make -C ci-tests $@
