#!/usr/bin/env bash

cd /etc/nixos

git add .
git commit -m "asdf"

nixos-rebuild boot --sudo
