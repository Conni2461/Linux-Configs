#!/bin/sh

xinput --set-prop "Microsoft Surface Keyboard Touchpad" "libinput Accel Speed" 0.5

i3-msg 'workspace term; exec gnome-terminal -- tmux'
sleep 1
i3-msg 'workspace web; exec chromium'
sleep 4
# i3-msg 'workspace music; exec spotify'
# sleep 3
