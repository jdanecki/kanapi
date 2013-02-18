#!/bin/bash

export   OPCODEDIR=/kanapi_packages/Csound-5.19.01/lib/csound/plugins
export   CSSTRNGS=/kanapi_packages/Csound-5.19.01/share/locale/
export LD_LIBRARY_PATH=/kanapi_packages/Csound-5.19.01/lib:${LD_LIBRARY_PATH}
cd /kanapi_packages/Csound-5.19.01/bin
./csound5gui $*

