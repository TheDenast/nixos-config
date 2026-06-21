{
  description = "Denast's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # Pinned to the commit before librewolf was marked vulnerable by hydra
    # (52a5a3bdd7ae63d08c6015a30ee10ae0ae030786); remove once nixos-unstable
    # head advances past the PR that restored the maintainer.
    nixpkgs-librewolf.url = "github:NixOS/nixpkgs/6f11897ec8e4ccc7b46ba57b3fe4678e8d857b8d";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      nixpkgsConfig = {
        allowUnfree = true;
        permittedInsecurePackages = [ "segger-jlink-qt4-810" ];
        segger-jlink.acceptLicense = true;
      };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations = {
        framework-13 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.config = nixpkgsConfig; }
            {
              nixpkgs.overlays = [
                (final: prev: {
                  librewolf = inputs.nixpkgs-librewolf.legacyPackages.${system}.librewolf;
                })
              ];
            }
            ./configuration.nix
            ./hosts/framework-13
            nixos-hardware.nixosModules.framework-13-7040-amd
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.denast = import ./home.nix;
              };
            }
          ];
        };
      };
    };
}
