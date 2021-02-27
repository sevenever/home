#!/bin/bash

case $1 in
    4k)
    xrandr --dpi 96 --fb 4800x4860 --output eDP --scale 2x2 --mode 1920x1080 --pos 0x2700 --output DisplayPort-0 --scale 1.25x1.25 --mode 3840x2160 --rate 60 --pos 0x0
    ;;
    1k)
    xrandr --dpi 96 --fb 3840x2160 --output eDP --scale 2x2 --mode 1920x1080 --pos 0x0
    ;;
    off)
    xrandr --dpi 96 --fb 3840x2160 --output eDP --scale 2x2 --mode 1920x1080 --pos 0x0 --output DisplayPort-0 --off
    ;;
    l)
    xrandr --dpi 96 --fb 3840x4320 --output eDP --scale 2x2 --mode 1920x1080 --pos 0x2160 --output DisplayPort-0 --scale 0.9999x0.9999 --mode 3840x2160 --rate 60 --pos 0x0
    ;;
    v)
    xrandr --dpi 96 --fb 6000x3840 --output eDP --scale 2x2 --mode 1920x1080 --pos 0x1680 --output DisplayPort-0 --scale 0.9999x0.9999 --mode 3840x2160 --rate 60 --pos 3840x0
    ;;
    *)
    xrandr --dpi 96 --fb 7680x2160 --output eDP --scale 2x2 --mode 1920x1080 --pos 3840x0 --output DisplayPort-0 --scale 0.9999x0.9999 --mode 3840x2160 --rate 60 --pos 0x0
esac
