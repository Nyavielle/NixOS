{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop environment
    alacritty
    brightnessctl
    grim
    hypridle
    hyprland
    hyprlock
    hyprpaper
    hyprpicker
    libnotify
    libsForQt5.xwaylandvideobridge
    papirus-icon-theme
    playerctl
    slurp
    starship
    waybar
    wl-clipboard
    wofi
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

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
