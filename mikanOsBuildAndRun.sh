#!/bin/bash

# 先にtarget.txtを修正

echo "--- kernel build start ---"

source $HOME/osbook/devenv/buildenv.sh

cd $HOME/mikanos/kernel
clang++ $CPPFLAGS -O2 --target=x86_64-elf -fno-exceptions -ffreestanding -c main.cpp
ld.lld $LDFLAGS --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o

echo "--- kernel build finished ---"

echo "--- efi build start ---"

# HOME直下にedk2がある前提
cd $HOME/edk2

source edksetup.sh

build

echo "--- efi build finished ---"

$HOME/osbook/devenv/run_qemu.sh $HOME/edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $HOME/mikanos/kernel/kernel.elf
