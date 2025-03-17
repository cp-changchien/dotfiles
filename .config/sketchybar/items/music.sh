#!/bin/env/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

music=(
  "${bracket_defaults[@]}"
  script="$PLUGIN_DIR/music.sh"
  popup.align=center
  padding_left=120
  label.padding_right=$PADDINGS
  padding_right=$(($PADDINGS * 1))
  drawing=off
  label="Loading…"
  background.image=media.artwork
  background.image.scale=0.75
  background.image.corner_radius=$PADDINGS
  icon.padding_left=37
  label.max_chars=15
  updates=on
  --subscribe music media_change
)

sketchybar                       \
  --add item music right         \
  --set      music "${music[@]}"
