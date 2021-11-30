#!/usr/bin/env bash

version="1.17.1-37.1.0"
servername="TestServer"

mkdir $servername
cp ./eula.txt ./$servername/
cd $servername
wget https://maven.minecraftforge.net/net/minecraftforge/forge/$version/forge-$version-installer.jar -O Installer.jar
java -jar Installer.jar -installServer
rm Installer.jar
echo Server Installed, Installer Removed.
