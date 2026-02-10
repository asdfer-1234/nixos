#!/usr/bin/env bash

cd /etc/nixos

git add .
git commit -m "asdf"

if [ -v NIXOS_SPECIALISATION ]; then
    nixos-rebuild boot --sudo --specialisation=$NIXOS_SPECIALISATION
else
    nixos-rebuild boot --sudo
fi
