#!/bin/sh

/home/conni/bin/external/nfancurve/temp.sh &> /dev/null &
disown -h %$(jobs -l | grep temp.sh | cut -d' ' -f 1 | tr -d -c '[:digit:]')

g810-led -a ff0000 &
pgrep dunst >/dev/null || dunst &
pgrep compton >/dev/null || compton &
fixdisplay &
nitrogen --restore &
pgrep clipmenud >/dev/null|| clipmenud &

syncshared >/dev/null &
newsup >/dev/null &
mailsync >/dev/null &

dwmbar &
conky &

calnotify 30 &
