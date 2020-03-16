#!/usr/bin/env bash

filelist=""
for line in "$@"; do
  filename=$(basename -- "$line")
  filelist="$filelist$filename\n"
done
printf "$filelist" | xclip -selection clipboard
