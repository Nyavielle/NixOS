{ stateVersion, user, ... }:
{
  imports = [
    # ./config
    ./home-packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = stateVersion;
  };
}
