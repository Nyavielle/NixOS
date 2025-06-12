{
  description = "Configuration for NixOS";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... } @inputs:
  let
    setups = [
      {
        setupName = "Laptop";
        user = "Nyavielle";
        timezone = "Europe/Kyiv";
        system = "x86_64-linux";
        stateVersion = "25.05";
      }
    ];

    makeSetup = { setupName, user, timezone, system, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;

      specialArgs = {
        inherit inputs setupName user timezone system stateVersion;
      };

      modules = [
        ./setups/${setupName}/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${user} = ./setups/${setupName}/home-manager/home.nix;
            extraSpecialArgs = {
              inherit inputs setupName user timezone system stateVersion;
            };
          };
        }
      ];
    };
  in
  {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: setup:
    configs // {
      "${setup.setupName}" = makeSetup {
        inherit (setup) setupName user timezone system stateVersion;
      };
    }) {} setups;
  };
}
