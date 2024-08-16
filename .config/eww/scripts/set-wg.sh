#!/bin/zsh

value=$(sudo wg show)

if [[ "$value" == "" ]] then
  wg-quick up /etc/wireguard/Falcon-Arch.conf
else
  wg-quick down /etc/wireguard/Falcon-Arch.conf
fi
