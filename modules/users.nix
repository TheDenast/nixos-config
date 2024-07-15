{ config, pkgs, inputs, ... }:

{
  users.users.denast = {
    isNormalUser = true;
    description = "denast";
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
    packages = with pkgs; [
      kate
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "denast" = import ../home.nix;
    };
  };
}
