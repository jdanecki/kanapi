all: travis_test
#bbs

cross_compilers:
	cd ../cross_compilers/`uname -m` ; make gcc ACTION=install
	cd ../kanapi_system/`uname -m`   ; make cross_gcc ACTION=install

travis_test: check_travis
	cd ../kanapi_system/`uname -m`   ; make openssl	 ACTION=install
	cd ../kanapi_system/`uname -m`   ; make git	 ACTION=install
	cd ../kanapi_system/`uname -m`   ; make coreutils	 ACTION=install

check_travis:
	if [ $${TRAVIS} = "true" ] ; then ./prepare_links ; fi

bbs: check_travis
	cd ../kanapi_system/`uname -m`   ; make bbs	 ACTION=install

test:
	echo "tests disabled"

test_cross_compilers:
	cd ../cross_compilers/`uname -m` ; make gcc ACTION=test
	cd ../kanapi_system/`uname -m` ; make cross_gcc ACTION=test

