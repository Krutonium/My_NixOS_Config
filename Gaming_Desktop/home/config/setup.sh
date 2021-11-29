#!/usr/bin/env bash

# Making Links
echo Linking OpenRCT2...
OpenRCT2Path=~/.config/OpenRCT2/config.ini
rm $OpenRCT2Path
ln -s ~/.config/nixpkgs/config/OpenRCT2/openrct2.conf $OpenRCT2Path

echo Linking Nano...
NanoPath=~/.nanorc
rm $NanoPath
ln -s ~/.config/nixpkgs/config/nano.conf $NanoPath

# Setting Theme Stuff
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface icon-theme 'Obsidian-Purple'
gsettings set org.gnome.desktop.interface sound-theme 'Yaru'
