#!/bin/bash

default_packages=(
    pacman-contrib

    base-devel
    linux-headers

    qt5-wayland
    qt5ct
    qt6-wayland
    qt6ct
    qt5-svg
    qt5-quickcontrols2
    qt5-graphicaleffects
    gtk3
    polkit-gnome
    xdg-desktop-portal-hyprland

    python-requests
    
    pipewire
    wireplumber
    pamixer
    pavucontrol
    bluez
    bluez-utils
    blueman
    gvfs

    mako
    waybar
    wofi
    tofi
    swww
    swaylock-effects
    wlogout

    wl-clipboard
    cliphist

    swappy
    grim
    slurp

    zsh
    stow
    htop

    kitty
    tmux
    neovim

    jq
    ansible
    aws-cli
    terraform
    packer

    thunar
    thunar-archive-plugin
    file-roller
    papirus-icon-theme

    lxappearance
    xfce4-settings
    nwg-look-bin

    ttf-jetbrains-mono-nerd
    ttf-anonymouspro-nerd
    ttf-font-awesome
    noto-fonts-emoji

    google-chrome
    telegram-desktop
    github-desktop-bin
    visual-studio-code-bin
    dbeaver
    redisinsight
    xpadneo-dkms
    vlc
)

# set some colors
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"

INSTALL_LOG="install.log"

show_progress() {
    while ps | grep $1 &> /dev/null;
    do
        echo -n "."
        sleep 2
    done
    echo -en "Done!\n"
    sleep 2
}

install_software() {
    if yay -Q $1 &>> /dev/null ; then
        echo -e "$COK - $1 is already installed."
    else
        echo -en "$CNT - Now installing $1 ."
        yay -S --noconfirm $1 &>> $INSTALL_LOG &
        show_progress $!

        if yay -Q $1 &>> /dev/null ; then
            echo -e "\e[1A\e[K$COK - $1 was installed."
        else
            # if this is hit then a package is missing, exit to review log
            echo -e "\e[1A\e[K$CER - $1 install had failed, please check the install.log"
            exit
        fi
    fi
}

for PACKAGE in ${default_packages[@]}; do
    install_software $PACKAGE 
done

rm -rf ~/.config/hypr
rm -rf ~/.config/waybar
rm -rf ~/.config/tofi
rm -rf ~/.config/wofi
rm -rf ~/.config/kitty
rm -rf ~/.config/mako
rm -rf ~/.config/gtk-3.0

stow -v -t ~/.config .config
