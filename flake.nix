{
  description = "Denast's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      nixpkgsConfig = {
        allowUnfree = true;
        permittedInsecurePackages = ["segger-jlink-qt4-810"];
        segger-jlink.acceptLicense = true;
      };
    in {
      nixosConfigurations = {
        asus-ga401iu = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.config = nixpkgsConfig; }
            ./configuration.nix
            ./hosts/asus-ga401iu
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

        framework-13 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.config = nixpkgsConfig; }
            ./configuration.nix
            ./hosts/framework-13
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
