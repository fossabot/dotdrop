#!/usr/bin/env bash

filelist=""
for line in "$@"; do
  filelist="$filelist$line\n"
done
printf "$filelist" | xclip -selection clipboard
