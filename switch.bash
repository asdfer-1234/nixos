#!/usr/bin/env bash

cd /etc/nixos

git add .
git commit -m "asdf"

if [ -v NIXOS_SPECIALIZATION ]; then
    echo asdf
    nixos-rebuild switch --sudo --specialisation=$NIXOS_SPECIALIZATION
else
    echo zxcv
    nixos-rebuild switch --sudo
fi
