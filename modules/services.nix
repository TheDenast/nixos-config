{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.startx.enable = true;

  # Needed for secret saving on hyprland
  services.gnome.gnome-keyring.enable = true;

  services.xserver.videoDrivers = [
    "amdgpu"
  ];

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  services.flatpak.enable = true;

  # Enhanced XDG portal configuration for Wayland/gamescope
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    config = {
      common = {
        default = "gtk";
        "org.freedesktop.impl.portal.Screenshot" = "wlr";
        "org.freedesktop.impl.portal.ScreenCast" = "wlr";
      };
      hyprland = {
        default = "gtk";
        "org.freedesktop.impl.portal.Screenshot" = "wlr";
        "org.freedesktop.impl.portal.ScreenCast" = "wlr";
      };
    };
  };

  services.syncthing = {
    enable = true;
    user = "denast";
    configDir = "/home/denast/.config/syncthing";
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services.fprintd.enable = true;

  security.pam.services.sudo.fprintAuth = true;

  services.udev.packages = [
    pkgs.yubikey-personalization
  ];

  services.pcscd.enable = true;

  services.fwupd.enable = true;
  services.fwupd.package = pkgs.fwupd;

  services.ratbagd.enable = true;

  systemd.user.services.activitywatch = {
    description = "ActivityWatch server";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.aw-server-rust}/bin/aw-server";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  systemd.user.services.aw-awatcher = {
    description = "AWatcher - Wayland-compatible ActivityWatch watcher";
    wantedBy = [ "graphical-session.target" ];
    after = [
      "activitywatch.service"
      "graphical-session.target"
    ];
    requires = [ "activitywatch.service" ];
    serviceConfig = {
      ExecStart = "${pkgs.awatcher}/bin/awatcher --idle-timeout 180 --poll-time-idle 10 --poll-time-window 5";
      Restart = "on-failure";
      RestartSec = 5;
      # Wait a bit for ActivityWatch server to be ready
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 5";
    };
  };
}
