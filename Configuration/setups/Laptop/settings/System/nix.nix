{ stateVersion, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = stateVersion;

  services.flatpak.enable = true;
}
