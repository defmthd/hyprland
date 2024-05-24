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
    hyprland
    xdg-desktop-portal-hyprland

    zathura
    zathura-pdf-mupdf
    
    pipewire
    wireplumber
    pamixer
    pavucontrol
    bluez
    bluez-utils
    blueman
    gvfs
    gvfs-smb

    mako
    waybar
    wofi
    swaylock
    wlogout

    wl-clipboard
    cliphist

    swappy
    grim
    slurp

    zsh
    stow
    bat
    htop
    btop

    pass

    kitty
    tmux
    zellij
    mc
    fzf
    ripgrep

    neovim

    reflector
    rsync
    jq
    ansible
    terraform
    packer
    aws-cli

    rbenv
    ruby-build

    thunar
    thunar-archive-plugin
    tumbler
    file-roller
    papirus-icon-theme
    layan-cursor-theme-git
    mcmojave-cursors

    lxappearance
    xfce4-settings
    nwg-look-bin

    ttf-jetbrains-mono-nerd
    ttf-font-awesome
    ttf-pt-root-ui
    noto-fonts-emoji

    jre-openjdk

    google-chrome
    telegram-desktop
    slack-desktop
    github-desktop-bin
    visual-studio-code-bin
    docker-desktop
    dbeaver
    # redisinsight
    swww

    xpadneo-dkms

    mpv
    yt-dlp

    auto-cpufreq

    wine-staging
    wine-mono
    wine-gecko
    winetricks

    outline-client-appimage

    # brightnessctl
    # zenbook-sound-fix-ux3405ma
    # intel-media-driver
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
        sleep 1
    done
    echo -en "Done!\n"
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
rm -rf ~/.config/eww
rm -rf ~/.config/tofi
rm -rf ~/.config/wofi
rm -rf ~/.config/swaylock
rm -rf ~/.config/wlogout
rm -rf ~/.config/htop
rm -rf ~/.config/kitty
rm -rf ~/.config/zellij
rm -rf ~/.config/mc
rm -rf ~/.config/ranger
rm -rf ~/.config/mako
rm -rf ~/.config/gtk-3.0
rm -rf ~/.config/xsettingsd
rm -rf ~/.config/xfce4
rm -rf ~/.config/nvim

rm -rf ~/.icons/default

rm -rf ~/.gtkrc-2.0

stow -v -t ~/.config .config
stow -v -t ~/.icons .icons

ln -s "$(pwd)/.gtkrc-2.0" ~/.gtkrc-2.0

