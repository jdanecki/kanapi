include ../scripts/config.kanapi

test_binutils test_glibc test_gmp test_linux test_mpc test_mpfr: 
	@echo "!!! tests for $@ missing !!!"

test_gcc: test_gcc.c
	@echo "tests for $@ for TARGET=$(KANAPI_TARGET_NAME)"
	if [ ! -d $(KANAPI_BASE)/tests_results ] ; then mkdir $(KANAPI_BASE)/tests_results ; fi
	. ./set_variables; echo $$PATH;  $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-gcc -v $< -Wall -o $(KANAPI_BASE)/tests_results/$@

test_libstdcpp: test_libstdcpp.cpp
	@echo "tests for $@ for TARGET=$(KANAPI_TARGET_NAME)"
	if [ ! -d $(KANAPI_BASE)/tests_results ] ; then mkdir $(KANAPI_BASE)/tests_results ; fi
	. ./set_variables; echo $$PATH;  $(KANAPI_BASE)/gcc-$(gcc_ver)/bin/$(KANAPI_TARGET_NAME)-g++ -v $< -Wall -lstdc++ -o $(KANAPI_BASE)/tests_results/$@

