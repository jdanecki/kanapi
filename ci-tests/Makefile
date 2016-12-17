all: bbs

cross_compilers:
	cd ../cross_compilers/`uname -m` ; make gcc ACTION=install
	cd ../kanapi_system/`uname -m`   ; make cross_gcc ACTION=install


travis_test:
	cd ../kanapi_system/`uname -m`   ; make busybox	 ACTION=download
	cd ../kanapi_system/`uname -m`   ; make bash	 ACTION=download

bbs:
	if [ $${TRAVIS} = "true" ] ; then ./prepare_links ; fi
	cd ../kanapi_system/`uname -m`   ; make bbs	 ACTION=install

test:
	echo "tests disabled"

test_cross_compilers:
	cd ../cross_compilers/`uname -m` ; make gcc ACTION=test
	cd ../kanapi_system/`uname -m` ; make cross_gcc ACTION=test

