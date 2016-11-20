At this moment KaNaPi contains build system to prepare basic system.
It is built from sources by using scripts.

There are 4 steps to create KaNaPi filesystem:
- download sources of packages from sources/RELEASES from SF page
- create FBS - see info in first_build_system/README
- create SBS - see info in second_build_system/steps
- create KBS - see info in kanapi_base_system/steps

Using above steps you can prepare about 600 packages.

There is also new method to build KaNaPi.
- make directory /kanapi_build/src
  This directory will contain downloaded packages and source for compilation
- copy script cross_compilers/scripts/pkg_kanapi to your PATH, for example /usr/local/bin
- compile basic cross-compilers by running command
  ./install all
  in directory cross_compilers/x86 or cross_compilers/x86_64 or cross_compilers/arm.
  It depends on what target platform do you want to use.
  Cross-compilers will be installed in /kanapi_${VER}/`uname -m`/cross/${KANAPI_TARGET}
- compile all packages in the directory kanapi_system/x86 or kanapi_system/x86_64 or kanapi_system/arm
  using command
  ./install all	
  Packages will be installed in /kanapi_${VER}/${KANAPI_TARGET}/packages

