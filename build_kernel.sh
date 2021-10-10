#!/bin/bash

echo "--- kernel build start ---"

source $HOME/osbook/devenv/buildenv.sh

cd kernel
clang++ $CPPFLAGS -O2 --target=x86_64-elf -fno-exceptions -ffreestanding -c main.cpp
ld.lld $LDFLAGS --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o

echo "--- kernel build finished ---"