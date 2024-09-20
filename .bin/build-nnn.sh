#!/bin/bash

# Clone and build nnn with a flag to support icons
git clone https://github.com/jarun/nnn/ /tmp/nnn-build/
cd /tmp/nnn-build/ || exit
make O_NERD=1
cp nnn /bin/nnn
cd .. || exit
rm -rf nnn-build
