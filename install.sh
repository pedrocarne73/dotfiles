#! /bin/bash

#Setting dnf
echo "fastestmirror=True" >> /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf

#using the instalation archives
source ./gnome/app.sh
source ./gnome/extensions.sh

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
