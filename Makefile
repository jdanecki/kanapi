# 'test-sbs' and 'bbs' targets are supported only under Jenkins config

all test test-sbs bbs:
	make -C ci-tests $@
