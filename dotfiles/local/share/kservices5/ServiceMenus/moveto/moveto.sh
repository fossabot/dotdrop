#!/usr/bin/env bash

dirname="$(kdialog --getexistingdirectory .)"

for file in "$@"; do
  kdemv5 --interactive $file $dirname || kdialog --error "Something went wrong"
done

# dirname="$(kdialog \
#   --getexistingdirectory . \
#   )" &&

# mkdir -p -- "$dirname" &&

# mv --target-directory="$dirname" -- "$@" ||

# kdialog --error "Something went wrong"
