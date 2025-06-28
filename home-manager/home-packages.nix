{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop environment
    alacritty
    grim
    hypridle
    hyprland
    hyprlock
    hyprpaper
    hyprpicker
    slurp
    starship
    waybar
    wl-clipboard
    wofi
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    papirus-icon-theme

    # Desktop apps
    bitwarden-desktop
    firefox
    imv
    mpv
    steam
    telegram-desktop
    vesktop
    zathura

    # CLI utils
    btop
    curl
    docker
    git
    htop
    neofetch
    neovim
    ranger
    tree
    unzip
    wget
    yt-dlp
    zip

    # Compilers
    cargo
    clang
    nodejs
    python3Full
  ];
}
