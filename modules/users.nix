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
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
