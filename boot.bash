#!/usr/bin/env bash

cd /etc/nixos

git add .
git commit -m "asdf"

export NIXPKGS_ALLOW_UNFREE=1

nixos-rebuild boot --sudo --impure
