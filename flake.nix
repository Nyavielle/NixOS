{
  description = "Configuration for NixOS";

  inputs = {
  
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astronvim = {
      url = "github:AstroNvim/template";
      flake = false;
    };
    
  }; # inputs

  outputs = { self, nixpkgs, nur, home-manager, astronvim, ... } @inputs: let
  
    user = "Nyavielle";

    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
      overlays = [ nur.overlays.default ];
    };

    hosts = [
      { hostname = "NixOS"; stateVersion = "25.05"; }
    ];

    makeSystem = { hostname, stateVersion, ... }:
    nixpkgs.lib.nixosSystem {
      pkgs = pkgs;

      specialArgs = {
        inherit inputs user hostname stateVersion;
      };
      
      modules = [
        ./hosts/${hostname}/modules

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = false;
            useUserPackages = true;
            users.${user} = ./hosts/${hostname}/home-manager/home.nix;
            extraSpecialArgs = {
              inherit inputs user hostname stateVersion pkgs;
            };
          };
        }
      ];
    };
    
  in {
  
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
    configs // {
      "${host.hostname}" = makeSystem {
        inherit (host) hostname stateVersion;
      };
    }) {} hosts;
    
  };
}
