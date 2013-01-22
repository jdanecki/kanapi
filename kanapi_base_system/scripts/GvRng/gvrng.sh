#!/bin/bash
#
# Copyright (c) 2012 Jacek Danecki <jacek.m.danecki@gmail.com>
#
# This file is part of KaNaPi project
#
# KaNaPi is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# KaNaPi is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with KaNaPi.  If not, see <http://www.gnu.org/licenses/>.

cd /kanapi_packages/GvRng-4.4
export  PYTHONPATH="/kanapi_packages/pygtk-2.24.0/lib/python2.7/site-packages/gtk-2.0:/kanapi_packages/pygobject-2.28.6/lib/python2.7/site-packages:/kanapi_packages/py2cairo-1.10.0/lib/python2.7/site-packages:/kanapi_packages/pygobject-2.28.6/lib/python2.7/site-packages/gtk-2.0:/kanapi_packages/pygtksourceview-2.10.1/lib/python2.7/site-packages"

python gvrng.py
