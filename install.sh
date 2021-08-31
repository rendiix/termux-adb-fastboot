#!/data/data/com.termux/files/usr/bin/bash
# File       : install.sh
# Author     : rendiix <vanzdobz@gmail.com>
# Create date:  6-Dec-2019 12:06
# install.sh
# Copyright (c) 2019 rendiix <vanzdobz@gmail.com>
#
#      DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#               Version 2, December 2004
#
# Everyone is permitted to copy and distribute verbatim or 
# modified copies of this license document,and changing it
# is allowed as long as the name is changed.
#
#      DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#           TERMS AND CONDITIONS FOR COPYING,
#             DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.

# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
apt-get update
apt-get  --assume-yes upgrade
apt-get  --assume-yes install coreutils gnupg wget
# Make the sources.list.d directory
[ ! -d $PREFIX/etc/apt/sources.list.d ] && mkdir $PREFIX/etc/apt/sources.list.d
# Write the needed source file
if [ ! -f "$PREFIX/etc/apt/sources.list.d/rendiix.list" ]; then
echo "deb https://rendiix.github.io android-tools termux" > $PREFIX/etc/apt/sources.list.d/rendiix.list

echo -e "\ngetting the repo key...\n"
wget https://rendiix.github.io/rendiix.gpg -q --show-progress
apt-key add rendiix.gpg
apt-get update
else
echo -e "\nrepo already installed\n"
apt update
fi
if [ "$?" = 0 ]; then
	apt-get --assume-yes install platform-tools
	echo -e "\nDone! android-tools-adb-fastboot succesfully installed"
else
	echo -e "\nSometing wrong, please re run this script"
	exit 1
fi

rm rendiix.gpg

