#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

reload_workspace_icon() {
    apps=$(aerospace list-windows --workspace "$@" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    local label="$@"

    # Conditionally set the label for leftSquareBracket
    if [[ $@ == "leftSquareBracket" ]]; then
        label="["
    fi

    icon_strip=" "
    if [ "${apps}" != "" ]; then
        while read -r app
    do
        icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<< "${apps}"
    else
        icon_strip=" —"
    fi

    sketchybar --animate sin 10 --set space.$@ label="$icon_strip"
}

if [ "$SENDER" = "space_windows_change" ]; then
    for wspace in $(aerospace list-workspaces --all); do
        reload_workspace_icon $wspace 
    done
fi
