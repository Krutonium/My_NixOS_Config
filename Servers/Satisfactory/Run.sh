#!/usr/bin/env bash

nix-shell --pure \
          -p "steam-run-native" \
          --run "steam-run ./SatisfactoryDedicatedServer/FactoryServer.sh -NOSTEAM"
