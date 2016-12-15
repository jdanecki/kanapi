all:
	cd ../cross_compilers/`uname -m` ; make gcc ACTION=install
	cd ../kanapi_system/`uname -m`   ; make cross_gcc ACTION=install

test:
	cd ../cross_compilers/`uname -m` ; make gcc ACTION=test
	cd ../kanapi_system/`uname -m` ; make cross_gcc ACTION=test


