#!/usr/bin/env bash

# Default to sinks unless "source" is passed as an argument
if [ "$1" = "source" ]; then
  MEDIA_CLASS="Audio/Source"
  SETTINGS_KEY="default.audio.source"
else
  MEDIA_CLASS="Audio/Sink"
  SETTINGS_KEY="default.audio.sink"
fi

# Get PipeWire dump
pw_dump=$(pw-dump -N 2>/dev/null)
if [ -z "$pw_dump" ]; then
  echo "Error: Failed to get pw-dump output."
  exit 1
fi

# Get list of nodes with the specified media class
nodes=$(echo "$pw_dump" | jq -r ".[] | select(.type == \"PipeWire:Interface:Node\") | select(.info.props[\"media.class\"] == \"$MEDIA_CLASS\") | .id" | sort -n)
if [ -z "$nodes" ]; then
  echo "No $MEDIA_CLASS nodes found."
  exit 1
fi

# Convert nodes to an array
readarray -t node_array <<< "$nodes"

# Get current default node from metadata
current_default=$(echo "$pw_dump" | jq -r ".[] | select(.type == \"PipeWire:Interface:Metadata\") | select(.props[\"metadata.name\"] == \"default\") | .metadata[] | select(.key == \"$SETTINGS_KEY\") | .value.name")
if [ -z "$current_default" ]; then
  echo "No default $MEDIA_CLASS found, selecting first node."
  current_default_node_id=${node_array[0]}
else
  # Get the node ID of the current default
  current_default_node_id=$(echo "$pw_dump" | jq -r ".[] | select(.type == \"PipeWire:Interface:Node\") | select(.info.props[\"node.name\"] == \"$current_default\") | .id")
  if [ -z "$current_default_node_id" ]; then
    echo "Current default $MEDIA_CLASS not found in nodes, selecting first node."
    current_default_node_id=${node_array[0]}
  fi
fi

# Find the index of the current default node
current_index=0
for i in "${!node_array[@]}"; do
  if [ "${node_array[$i]}" = "$current_default_node_id" ]; then
    current_index=$i
    break
  fi
done

# Calculate the next node index (cycle back to 0 if at the end)
next_index=$(( (current_index + 1) % ${#node_array[@]} ))
next_node_id=${node_array[$next_index]}

# Set the new default node
wpctl set-default "$next_node_id" >/dev/null
if [ $? -eq 0 ]; then
  next_node_name=$(echo "$pw_dump" | jq -r ".[] | select(.type == \"PipeWire:Interface:Node\") | select(.id == $next_node_id) | .info.props[\"node.name\"]")
  echo "Default $MEDIA_CLASS set to: $next_node_name (ID: $next_node_id)"
else
  echo "Error: Failed to set default $MEDIA_CLASS."
  exit 1
fi

