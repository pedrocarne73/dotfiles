#! /bin/bash

#Installing extra repositories
#Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#RPM-FUSION Free and Non-free
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf config-manager --set-enabled rpmfusion-free 
dnf config-manager --set-enabled rpmfusion-free-updates 
dnf config-manager --set-enabled rpmfusion-nonfree 
dnf config-manager --set-enabled rpmfusion-nonfree-updates 
dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver 
dnf config-manager --set-enabled rpmfusion-nonfree-steam 

#Enable sublime-text-repo
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg 
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

#VSCodium enable repo
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo

#Brave web-browser enable repo
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

#Copr repos
#Waydroid
sudo dnf copr enable aleasto/waydroid
sudo dnf update

#Install the programs
#These are for themes and extensions
sudo dnf install gnome-tweaks gnome-extensions-app -y

#Desing and music
sudo dnf install gimp inkscape blender ardour6 -y

#Programming
sudo dnf install sublime-text codium gvim godot kitty -y 
sudo dnf install java java-devel make automake gcc gcc-c++ kernel-devel moby-engine -y

#Nvidia drivers
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y 

#Daily use and Retroarch
sudo dnf install fragments thunderbird brave-browser fish -y
sudo dnf install @multimedia lsb -y
flatpak install flathub org.libretro.RetroArch -y
sudo dnf install waydroid -y
sudo waydroid init -c https://ota.waydro.id/system -v https://ota.waydro.id/vendor
sudo systemctl enable --now waydroid-container
