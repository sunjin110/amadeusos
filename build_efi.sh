#!/bin/bash

echo "--- efi build start ---"

# HOME直下にedk2がある前提
cd $HOME/edk2

source edksetup.sh

build

echo "--- efi build finished ---"
