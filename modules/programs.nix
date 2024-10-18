{ ... }:

{
  programs.hyprland = {
     # Install the packages from nixpkgs
     enable = true;
     # Whether to enable XWayland
     xwayland.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # programs.firefox.enable = true;  

  # Gamemode (should enchance gaming :O)
  programs.gamemode.enable = true;
}
