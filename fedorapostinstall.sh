#!/bin/sh
#
# Fedora Post Install
#
# Description: A shell script for enabling RPMFusion repositories, installing multimedia codecs and enabling flatpak on Fedora.
# 
# The following terminal commands are taken from https://rpmfusion.org/Configuration/ and https://flatpak.org/setup/Fedora/

echo Fedora Post Install && echo Script Started.

enable_rpmfusion_repo()
{
	# To enable access to both the free and the nonfree repository use the following command: 
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
}

install_mulmedia_tainted_repo()
{
	# To install appstream-data:
	sudo dnf groupupdate core -y

	# To install the complements multimedia packages needed by gstreamer enabled applications:
	sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

	# To install the sound-and-video complement packages needed by some applications:
	sudo dnf groupupdate sound-and-video -y

	# To enable tainted repositories
	sudo dnf install rpmfusion-free-release-tainted -y
	sudo dnf install rpmfusion-nonfree-release-tainted -y
}

enable_flatpak_repo()
{
	# To enable flatpak repository
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

error()
{
	# Error message
	echo ERROR! Run Script Again. && exit 0
}

success()
{
	#Success message
	echo Script Completed. && echo Success! && sleep 1
}

cleanup()
{	
	# Delete script, close terminal and exit
	rm -r fedorapostinstall.sh ; kill -9 $PPID ; exit 0
}

enable_rpmfusion_repo && install_mulmedia_tainted_repo && enable_flatpak_repo && success && cleanup || error
