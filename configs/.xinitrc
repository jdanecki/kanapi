#!/bin/bash
#
#  Copyright (c) 2012-2016 Jacek Danecki <jacek.m.danecki@gmail.com>
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

export USE_EXTERNAL_DXTN_LIB=1

gui() {
	eval `dbus-launch --sh-syntax --exit-with-session`
	setxkbmap pl
	alsactl init
	#/root/start_xfce
	#run xfconfd
	xfconf-query -l
	echo xfsettingsd
	xfsettingsd
	echo xfwm4
	xfwm4 --daemon
	echo xfdesktop
	xfdesktop &
#	dzien_dobry &
	xfce4-notes &
	xset s off
	xset s noblank
	xset -dpms

#	/kanapi_packages/kanapi/kanapi.rb
	xfce4-panel 

}
#dsi_off
gui
#xterm

