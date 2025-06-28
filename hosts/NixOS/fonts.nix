{ pkgs, ... }:
{
  fonts.packages = with pkgs;
  [
    nerd-fonts.fira-code
    terminus_font
  ];
}
