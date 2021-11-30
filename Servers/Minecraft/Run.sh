#!/usr/bin/env bash

nix-shell --pure \
          -p "openjdk16" \
          --run "ToRunScript.sh"
