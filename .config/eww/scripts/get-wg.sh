#!/bin/zsh

sudo wg show | awk '/^\s+transfer:/{print $2" "$3}'
