{ pkgs, ... }:

{
  users.users.denast = {
    isNormalUser = true;
    description = "denast";
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
    packages = with pkgs; [
      kate
    ];
  };

  # Remove the home-manager configuration from here
}
