#!/bin/bash
# Shivang Saxena
# A very unintelligent script to lower/raise brightness.
# First argument must be a '+' or '-' 

direction=$1
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)

if [ $direction = "+" ]
then
    new_brightness=$(printf %.0f $(echo "$current_brightness + 50" | bc -l))
    $(echo "$new_brightness" >> /sys/class/backlight/intel_backlight/brightness) 
else 
    new_brightness=$(printf %.0f $(echo "$current_brightness - 50" | bc -l))
    $(echo "$new_brightness" >> /sys/class/backlight/intel_backlight/brightness) 
fi

