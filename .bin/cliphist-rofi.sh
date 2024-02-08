#!/bin/sh

# Script to control cliphist as a rofi mode, images included
# Cloned from https://github.com/sentriz/cliphist/blob/master/contrib/cliphist-rofi-img and a bit changed

tmp_dir="/tmp/cliphist"
rm -rf "$tmp_dir"

if [ -n "$1" ]; then
    cliphist decode < "$1" | wl-copy
    exit
fi

mkdir -p "$tmp_dir"

read -r -d '' prog << EOF
/^[0-9]+\s<meta http-equiv=/ { next }
match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp)/, grp) {
    system("echo " grp[1] "\\\\\t | cliphist decode >$tmp_dir/"grp[1]"."grp[3])
    print \$0"\0icon\x1f$tmp_dir/"grp[1]"."grp[3]
    next
}
1
EOF
cliphist list | gawk "$prog"
