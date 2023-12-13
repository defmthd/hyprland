rm -rf ~/.config/hypr
rm -rf ~/.config/waybar
rm -rf ~/.config/tofi
rm -rf ~/.config/wofi
rm -rf ~/.config/kitty
rm -rf ~/.config/mako
rm -rf ~/.config/gtk-3.0

stow -v -t ~/.config .config
