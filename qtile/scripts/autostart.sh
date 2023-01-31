#!/bin/bash

#starting utility applications at boot time
volumeicon &
nm-applet &
numlockx on &
picom --config $HOME/.config/qtile/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

#starting user applications at boot time
onedriver &
blueman-applet &
nitrogen --restore  

#start sxhkd to replace Qtile native key-bindings
sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &