{ pkgs, ... }:

{
  users.users.denast = {
    isNormalUser = true;
    description = "denast";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
      "input"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Remove the home-manager configuration from here
}
