'''
Modify this file, by platform, to handle nonstandard options for third-party
dependencies. If you do modify this file, you should make it read-only
(or otherwise protect it) so that CVS will not overwrite it.

Order is important: place local paths ahead of system paths.
'''
import sys

customCPPPATH = []
customCCFLAGS = []
customCXXFLAGS = []
customLIBS = ["rt", "pthread", "dl", "m", "Xt", "X11", "Xext" ]
customLIBPATH = []
customSHLINKFLAGS = []
customSWIGFLAGS = []

if sys.platform[:5] == 'linux':
    platform = 'linux'
    customCPPPATH.append('/kanapi_packages/libsndfile-1.0.25/include')
    customCPPPATH.append('/kanapi_packages/fltk-1.3.2/include')
    customCPPPATH.append('/kanapi_packages/tcl-8.6.0/include')
    customCPPPATH.append('/kanapi_packages/portaudio-v19_20111121/include')
    customCPPPATH.append('/kanapi_packages/boost-1_52_0/include')
    customCPPPATH.append('/kanapi_packages/fluidsynth-1.1.1/include')
    customCPPPATH.append('/kanapi_packages/zlib-1.2.7/include')
    customCPPPATH.append('/kanapi_packages/lua-5.2.1/include')
    customCPPPATH.append('/kanapi_packages/Python-2.7.3/include/python2.7')
    customCPPPATH.append('/kanapi_packages/libpng-1.5.13/include')
    customCPPPATH.append('/kanapi_packages/alsa-lib-1.0.25/include')
    customCPPPATH.append('/kanapi_packages/xproto-7.0.23/include')
    customCPPPATH.append('/kanapi_packages/libX11-1.5.0/include')
    customCPPPATH.append('/kanapi_packages/tk-8.6.0/include')
    customCPPPATH.append('/kanapi_packages/libXt-1.1.3/include')
    customCPPPATH.append('/kanapi_packages/libXext-1.3.1/include')

    customLIBPATH.append('/kanapi_packages/libsndfile-1.0.25/lib')
    customLIBPATH.append('/kanapi_packages/fltk-1.3.2/lib')
    customLIBPATH.append('/kanapi_packages/tcl-8.6.0/lib')
    customLIBPATH.append('/kanapi_packages/portaudio-v19_20111121/lib')
    customLIBPATH.append('/kanapi_packages/boost-1_52_0/lib')
    customLIBPATH.append('/kanapi_packages/fluidsynth-1.1.1/lib')
    customLIBPATH.append('/kanapi_packages/zlib-1.2.7/lib')
    customLIBPATH.append('/kanapi_packages/lua-5.2.1/lib')
    customLIBPATH.append('/kanapi_packages/Python-2.7.3/lib')
    customLIBPATH.append('/kanapi_packages/libpng-1.5.13/lib')
    customLIBPATH.append('/kanapi_packages/alsa-lib-1.0.25/lib')
    customLIBPATH.append('/kanapi_packages/libX11-1.5.0/lib')
    customLIBPATH.append('/kanapi_packages/tk-8.6.0/lib')
    customLIBPATH.append('/kanapi_packages/libXt-1.1.3/lib')
    customLIBPATH.append('/kanapi_packages/libXext-1.3.1/lib')
	

