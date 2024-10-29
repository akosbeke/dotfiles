#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

reload_workspace_icon() {
    apps=$(aerospace list-windows --workspace "$1" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    local label="$1"

    icon_strip=" "
    if [ "${apps}" != "" ]; then
        while read -r app
    do
        icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<< "${apps}"
    else
        icon_strip=" —"
    fi

    sketchybar --animate sin 10 --set space.$1 display=$2 label="$icon_strip"
}

if [ "$SENDER" = "space_windows_change" ]; then
    monitors=$(aerospace list-monitors)

    # Iterate over each monitor
    for monitor_id in $monitors; do
        # Get the list of workspaces for the current monitor
        monitor_workspaces=$(aerospace list-workspaces --monitor "$monitor_id")

        # First, iterate over the predefined order
        for wspace in $monitor_workspaces; do
            reload_workspace_icon $wspace $monitor_id
        done
    done
fi
