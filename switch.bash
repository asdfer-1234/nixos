#!/usr/bin/env bash

cd /etc/nixos

git add .
git commit -m "asdf"

if [ -v NIXOS_SPECIALISATION ]; then
    echo asdf
    nixos-rebuild switch --sudo --specialisation=$NIXOS_SPECIALISATION
else
    echo zxcv
    nixos-rebuild switch --sudo
fi
