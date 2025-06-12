{ pkgs, ... }:
{
  home.packages = with pkgs;
  [
    # Desktop programs
    firefox
    bitwarden-desktop
    telegram-desktop
    vesktop
    steam
    spotify
    mpv
    zoom-us
    obsidian
    zathura

    # Terminal utils
    neovim
    ranger
    tree
    htop
    btop
    neofetch
    git
    docker
    flatpak
    yt-dlp
    zip
    unzip
    curl
    wget

    # Compilers
    clang
    cargo
    nodejs
    python3Full
  ];
}
