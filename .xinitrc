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

twm &

# Gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Set a background
feh --bg-scale ~/.wallpapers/arch-kde-3.png

# Start eww (for nice widgets and dash boards)
~/.bin/eww daemon &

# Set the cursor
xsetroot -cursor_name left_ptr


# Power Management
xfce4-power-manager &

# Start a screensaver
xscreensaver -no-splash &

exec xmonad
