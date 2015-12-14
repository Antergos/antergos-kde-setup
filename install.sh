#!/usr/bin/bash

# -*- coding: utf-8 -*-
#
#  install.sh
#
#  Copyright © 2013-2015 Antergos
#
#  This file is part of Antergos.
#
#  Antergos is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  Antergos is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with Antergos; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

USER_NAME=$1

if [ "$USER_NAME" == "" ]; then
  echo "Usage:"
  echo "./install.sh username"
  exit 0
fi

echo "Setting Antergos KDE setup to user $USER_NAME"

# All necessary files are in /DESTDIR/usr/share/antergos-kde-setup
SRCDIR=/usr/share/antergos-kde-setup
DSTDIR=/home/${USER_NAME}

# Copy generic files (this should be done in the PKGBUILD)
cp -R ${SRCDIR}/apps \
	${SRCDIR}/config \
	${SRCDIR}/icons \
	${SRCDIR}/themes \
	${SRCDIR}/skel \
	${SRCDIR}/wallpapers /usr/share

# Copy user files
cp -R ${SRCDIR}/skel/* ${DSTDIR}

chown -R ${USER_NAME}:users ${DSTDIR}
