{ pkgs, user, ... }:
{
  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  programs.zsh.enable = true;

  services.getty.autologinUser = user;

  security.sudo.wheelNeedsPassword = false;
}
