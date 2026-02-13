#!/usr/bin/env bash

cd /etc/nixos

git add .
git commit -m "asdf"

export NIXPKGS_ALLOW_UNFREE=1

if [ -v NIXOS_SPECIALISATION ]; then
    nixos-rebuild switch --sudo --specialisation=$NIXOS_SPECIALISATION --impure
else
    nixos-rebuild switch --sudo --impure
fi
