#! /bin/bash

#Setting dnf
echo "fastestmirror=True" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf

source ./gnome/app.sh
source ./gnome/extensions.sh
#making the directories for the dotfiles
mkdir $HOME/.dotfiles
mkdir $HOME/.dotfiles/dnf
mkdir $HOME/.dotfiles/fish
mkdir $HOME/.dotfiles/git
mkdir $HOME/.dotfiles/kitty
mkdir $HOME/.dotfiles/Wallpaper

#importing the dotfiles
#gitconfig
mv $HOME/.gitconfig mkdir $HOME/.dotfiles/git/gitconfig
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
#kitty
mv $HOME/.config/kitty/kitty.conf $HOME/.dotfiles/kitty/kitty.conf
ln -s $HOME/.dotfiles/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
#fish shell
mv $HOME/.config/fish/config.fish $HOME/.dotfiles/fish/config.fish
ln -s $HOME/.dotfiles/fish/config.fish $HOME/.config/fish/config.fish