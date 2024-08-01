#!/bin/env/bash


clock=(
  "${menu_defaults[@]}"
  icon.drawing=off          
  label.font="$FONT:Bold:10" 
  label.padding_right=0           
  y_offset=0         
  update_freq=10            
  popup.align=right
  script="$PLUGIN_DIR/nextevent.sh"
  click_script="sketchybar --set clock popup.drawing=toggle; open -a Calendar.app"
)


sketchybar                                      \
  --add item clock right                        \
  --set clock "${clock[@]}"                     \
  --subscribe clock system_woke                 \
                    mouse.entered               \
                    mouse.exited                \
                    mouse.exited.global         \
  --add item clock.next_event popup.clock       \
  --set clock.next_event "${menu_item_defaults[@]}" "${calendar_popup[@]}"
