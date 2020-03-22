#!/usr/bin/env bash

############################################
# Set both shift keys to trigger caps lock #
############################################
setxkbmap -option caps:none
setxkbmap -option "shift:both_capslock"

#xmodmap -e 'clear Lock'
xcape -t 200 -e '#66=Super_L|e'

# This is the code I use to turn my spacebar into the hyper key (.Xmodmap):

# ! Unmap capslock
# clear Lock
# keycode 108 = Hyper_L

# ! Leave mod4 as windows key _only_
# remove mod4 = Hyper_L

# ! Set mod3 to capslock
# add mod3 = Hyper_L

# keycode 65 = Hyper_L
# keycode any = space%

# And xcape command needed:

# xcape -e "Hyper_L=space"

# Perhaps you could adapt.
