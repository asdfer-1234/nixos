#!/usr/bin/env bash

cd /etc/nixos

git add .
git commit -m "asdf"

if [ -v NIXOS_SPECIALIZATION ]; then
    nixos-rebuild switch --sudo --specialisation=$NIXOS_SPECIALIZATION
else
    nixos-rebuild switch --sudo
fi
