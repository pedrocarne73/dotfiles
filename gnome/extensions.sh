#! /bin/bash

if [ -d "$HOME/.local/share/gnome-shell/extensions" ] then
	#Download extensions
	mk_extension(https://extensions.gnome.org/extension-data/easy_docker_containersred.software.systems.v14.shell-extension.zip) #Docker container simple
	mk_extension(https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip) #User Themes
	mk_extension(https://extensions.gnome.org/extension-data/gsconnectandyholmes.github.io.v50.shell-extension.zip) #GSconnect
	mk_extension(https://extensions.gnome.org/extension-data/clipboard-indicatortudmotu.com.v42.shell-extension.zip) #Clipboard
	mk_extension(https://extensions.gnome.org/extension-data/systemd-managerhardpixel.eu.v7.shell-extension.zip) #Systemd Manager
	mk_extension(https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v37.shell-extension.zip)
else
    echo "Error: Directory $HOME/.local/share/gnome-shell/extensions does not exists."
    #Make the dir
	mkdir $HOME/.local/share/gnome-shell/extensions
	echo "Creating Directory"
	sleep 0.5
fi

mk_extension($ARCH_DOWLD){
	wget -c $ARCH_DOWLD /tmp
	mkdir /tmp/unzipped
	unzip /tmp/easy_docker_containersred.software.systems.v14.shell-extension.zip /tmp/unzipped
	ARCH_NAME=$(jq '.uuid' /tmp/unzipped/metadata.json)
	mkdir $HOME/.local/share/gnome-shell/extensions/$ARCH_NAME
	mv /tmp/unzipped/* $HOME/.local/share/gnome-shell/extensions/$ARCH_NAME
}

