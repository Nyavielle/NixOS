{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs;
  [
    hyprland
    hyprpaper
    hypridle
    hyprlock

    waybar
    wofi

    playerctl
    brightnessctl

    alacritty
  ];
}
