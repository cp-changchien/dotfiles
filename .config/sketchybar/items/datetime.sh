#!/bin/env/bash

date=(
  icon=􀀁
  icon.drawing=off
  icon.font.size=6
  icon.padding_right=1
  icon.color=$(getcolor yellow)          
  icon.y_offset=0
  label.font="$FONT:Semibold:14"
  label.padding_left=0
  label.padding_right=0
  y_offset=0                         
  width=180                            
  update_freq=60                     
  script='sketchybar --set $NAME label="$(date "+%a, %b %d %T")"'
  click_script="open -a Calendar.app"
)

calendar_popup=(
  icon.drawing=off
  label.padding_left=0
  label.max_chars=22
)

sketchybar                                      \
  --add item date right                         \
  --set date "${date[@]}"                       \
  --subscribe date system_woke                  \
                   mouse.entered                \
                   mouse.exited                 \
                   mouse.exited.global          \
  --add item date.details popup.date            \
  --set date.details "${menu_item_defaults[@]}" \
