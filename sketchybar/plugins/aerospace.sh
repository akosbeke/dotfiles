#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ "$1" = "$AEROSPACE_FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
                           background.color=$SECONDARY_COLOR \
                           label.color=$WHITE \
                           icon.color=$WHITE
else
    sketchybar --set $NAME background.drawing=off \
                           label.color=$WHITE \
                           icon.color=$WHITE
fi
