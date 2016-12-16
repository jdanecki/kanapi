all: travis_compilers bbs

cross_compilers:
	cd ../cross_compilers/`uname -m` ; make gcc ACTION=install
	cd ../kanapi_system/`uname -m`   ; make cross_gcc ACTION=install

travis_compilers:
	./prepare_links

bbs:
	cd ../kanapi_system/`uname -m`   ; make bbs	 ACTION=install

test:
	echo "tests disabled"

test_cross_compilers:
	cd ../cross_compilers/`uname -m` ; make gcc ACTION=test
	cd ../kanapi_system/`uname -m` ; make cross_gcc ACTION=test

