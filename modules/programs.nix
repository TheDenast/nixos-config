{ ... }:

{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true; # universal wayland session manager
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
