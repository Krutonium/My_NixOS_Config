#!/usr/bin/env bash

nix-shell --pure \
          -p "openjdk16" \
          --run "cd TestServer; ./run.sh nogui"
