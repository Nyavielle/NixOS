{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "Bibata-Original-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
