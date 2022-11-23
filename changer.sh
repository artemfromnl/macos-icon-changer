#!/bin/bash

for icon in assets/*.icns; do
  name=$(echo "$icon" | sed -e "s/^assets\///" -e "s/.icns$//")
  fileicon set "/Applications/$name.app" "$icon"
done

for icon in assets/jetbrains/*.icns; do
  name=$(echo "$icon" | sed -e "s/^assets\/jetbrains\///" -e "s/.icns$//")
  fileicon set "$HOME/Applications/JetBrains Toolbox/$name.app" "$icon"

  find "$HOME/Library/Application Support/JetBrains/Toolbox" -name "$name*.app" |
  while read -r app; do
    fileicon set "$app" "$icon"
  done
done
