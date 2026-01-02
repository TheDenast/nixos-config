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
  # I allow my user to run these with sudo without
  # entering my password so that I can make it togglable in waybar
  security.sudo.extraRules = [
    {
      users = [ "denast" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/ectool autofanctrl";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/ectool fanduty 100";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
