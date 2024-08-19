#!/bin/bash

sketchybar --add event aerospace_workspace_change

# Define the specific order of workspaces
workspace_order=("U" "I" "O" "P" "leftSquareBracket" "7" "8")

# Get the list of all monitors
monitors=$(aerospace list-monitors)

# Create an associative array to keep track of the workspaces that have already been added
declare -A added_workspaces

# Function to add a workspace to sketchybar
add_workspace_to_sketchybar() {
    local sid=$1
    local monitor_id=$2
    local label="$sid"

    # Conditionally set the label for leftSquareBracket
    if [[ $sid == "leftSquareBracket" ]]; then
        label="["
    fi

    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
              icon="$label" \
              label.font="sketchybar-app-font:Regular:14.0" \
              label.padding_right=15 \
              label.y_offset=-1 \
              display=$monitor_id \
              click_script="aerospace workspace $sid" \
              script="$CONFIG_DIR/plugins/aerospace.sh $sid"
}

# Iterate over each monitor
for monitor_id in $monitors; do
    # Get the list of workspaces for the current monitor
    monitor_workspaces=$(aerospace list-workspaces --monitor "$monitor_id")

    # First, iterate over the predefined order
    for sid in "${workspace_order[@]}"; do
        if [[ $monitor_workspaces == *"$sid"* ]]; then
            add_workspace_to_sketchybar "$sid" "$monitor_id"
            added_workspaces[$sid]=1
        fi
    done

    # Then, iterate over all workspaces and add the ones that were not in the predefined order
    for sid in $monitor_workspaces; do
        if [[ -z ${added_workspaces[$sid]} ]]; then
            add_workspace_to_sketchybar "$sid" "$monitor_id"
        fi
    done
done

sketchybar --add item space_creator left \
           --set space_creator \
                 icon=􀆊 \
                 background.drawing=off \
                 script="$CONFIG_DIR/plugins/aerospace_windows.sh" \
                 icon.color=$ACCENT_COLOR \
                 display=active \
           --subscribe space_creator space_windows_change
