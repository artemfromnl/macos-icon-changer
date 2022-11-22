#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Permission denied"
    exit
fi

for icon in assets/*.icns; do
  name=$(echo "$icon" | sed -e "s/^assets\///" -e "s/.icns$//")
  fileicon set "/Applications/$name.app" "$icon"
done
