#!/bin/zsh

value=$(pactl list sources | awk '/^\s+Volume:/{print $5}' | sed 's/%//' | head -n 1 | awk '{print $1}')
echo $value
