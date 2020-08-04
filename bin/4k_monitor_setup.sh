#!/bin/sh

case $1 in
    4k)
    #xrandr --dpi 96 --fb 8640x4860 --output eDP --scale 2x2 --mode 1920x1080 --pos 4800x540 --output DisplayPort-0 --scale 1.25x1.25 --mode 3840x2160 --pos 0x0
    xrandr --dpi 96 --fb 7680x2160 --output eDP --scale 2x2 --mode 1920x1080 --pos 3840x0 --output DisplayPort-0 --scale 1x1 --mode 3840x2160 --pos 0x0
    gsettings set org.gnome.desktop.interface scaling-factor 2
    gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"
    ;;
    1k)
    xrandr --dpi 96 --fb 3840x2160 --output eDP --scale 2x2 --mode 1920x1080 --pos 0x0 --output DisplayPort-0 --off
    gsettings set org.gnome.desktop.interface scaling-factor 2
    gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"
    ;;
    off)
    xrandr --dpi 96 --fb 1920x1080 --output eDP --scale 1x1 --mode 1920x1080 --pos 0x0 --output DisplayPort-0 --off
    ;;
    *)
    echo "usage $0 [4k|1k|off]"
esac
