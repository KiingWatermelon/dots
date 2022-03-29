#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

xinput --set-prop 10 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 11 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 12 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 13 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 14 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 15 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 16 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 17 'libinput Accel Profile Enabled' 0, 1
megasync &
bluetoothctl power on &
xss-lock --transfer-sleep-lock -- i3lock --nofork -i /home/kiing/.wallpapers/i3lock.png &

nitrogen --restore &
#picom &
exec i3
