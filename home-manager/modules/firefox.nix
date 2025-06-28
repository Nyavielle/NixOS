{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    profiles.default.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons;
    [
      ublock-origin
      privacy-badger
      decentraleyes
      duckduckgo-privacy-essentials
      bitwarden
      darkreader
      vimium
    ];
  };
}
