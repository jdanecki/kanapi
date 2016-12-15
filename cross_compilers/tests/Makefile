include ../scripts/config.kanapi

test_gmp:
	./test_lib gmp

test_mpc:
	./test_lib mpc

test_mpfr:
	./test_lib mpfr

test_binutils:
	for i in addr2line ar as c++filt elfedit gprof ld ld.bfd nm objcopy objdump ranlib readelf size strings strip ;\
	do echo -n "$$i: " ; . ./set_variables ; ${KANAPI_TARGET_NAME}-$${i} --version | grep Binutils ; done

test_gcc:
	for i in cpp gcc gcc-ar gcc-nm gcc-ranlib ;\
	do echo -n "$$i: " ; . ./set_variables ; ${KANAPI_TARGET_NAME}-$${i} --version | grep -E "GCC|Binutils" ; done

test_gcc_glibc: test_gcc0.c test_gcc1.c
	@echo "tests for $@ for TARGET=$(KANAPI_TARGET_NAME)"
	@if [ ! -d $(KANAPI_BASE)/tests_results ] ; then mkdir $(KANAPI_BASE)/tests_results ; fi
	. ./set_variables; $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-gcc test_gcc0.c -Wall -o $(KANAPI_BASE)/tests_results/test_gcc0
	. ./set_variables; $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-gcc test_gcc1.c -Wall -o $(KANAPI_BASE)/tests_results/test_gcc1
	. ./set_variables; $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-gcc test_lm.c -Wall -o $(KANAPI_BASE)/tests_results/test_lm -lm
	. ./set_variables; $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-gcc test_backtrace.c -Wall -o $(KANAPI_BASE)/tests_results/test_backtrace
	. ./set_variables; $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-gcc test_clear_cache.c -Wall -o $(KANAPI_BASE)/tests_results/test_clear_cache

test_libstdcpp: test_libstdcpp.cpp test_threads.cpp
	@echo "tests for $@ for TARGET=$(KANAPI_TARGET_NAME)"
	@if [ ! -d $(KANAPI_BASE)/tests_results ] ; then mkdir $(KANAPI_BASE)/tests_results ; fi
	. ./set_variables; echo $$PATH;  $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-g++ test_libstdcpp.cpp -Wall -lstdc++ -o $(KANAPI_BASE)/tests_results/test_libstdcpp
	. ./set_variables; echo $$PATH;  $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-g++ test_threads.cpp -Wall -lstdc++ -std=c++11 -o $(KANAPI_BASE)/tests_results/test_threads -pthread

