#!/usr/bin/env bash

servername=test118
mkdir $servername
cp ./eula.txt ./$servername/
cd $servername
wget https://launcher.mojang.com/v1/objects/3cf24a8694aca6267883b17d934efacc5e44440d/server.jar -O Server.jar
java -jar Server.jar nogui
rm Server.jar
