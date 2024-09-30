{ pkgs, ... }:

{
  users.users.denast = {
    isNormalUser = true;
    description = "denast";
    extraGroups = [ "networkmanager" "wheel" "openrazer" "input" ];
    packages = with pkgs; [
      kate
    ];
  };

  # Remove the home-manager configuration from here
}
