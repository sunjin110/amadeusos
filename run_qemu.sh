#!/bin/bash

# osbookがHOME直下にあることを前提とする
echo "--- start qemu ---"
$HOME/osbook/devenv/run_qemu.sh $HOME/edk2/Build/AmadeusLoaderX64/DEBUG_CLANG38/X64/Loader.efi $HOME/amadeusos/kernel/kernel.elf
# ./run_qemu.sh ../../edk2/Build/AmadeusLoaderX64/DEBUG_CLANG38/X64/Loader.efi ../../amadeusos/kernel/kernel.elf 