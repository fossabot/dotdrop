#!/usr/bin/env bash

# active window app name
xprop -id `xdotool getactivewindow` |awk '/WM_CLASS/{print $4}'
