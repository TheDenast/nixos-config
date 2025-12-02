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
      "adbusers"
      "gamemode"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
