all:
	make -C ci-tests all

test:
	make -C ci-tests test

test-sbs:
	make -C ci-tests test-sbs

