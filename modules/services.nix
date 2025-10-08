{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.startx.enable = true;

  #  services.displayManager.sddm.package = pkgs.kdePackages.sddm;
  #  services.displayManager.sddm = {
  #    enable = true;
  #    extraPackages = with pkgs; [qt6.qt5compat];
  #    theme = "where_is_my_sddm_theme";
  # };

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
  # services.printing.drivers = [ pkgs.cnijfilter2 pkgs.canon-cups-ufr2 ];
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  #   openFirewall = true;
  # };

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

  # Fingerprint reader stuff
  # systemd.services.fprintd = {
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig.Type = "simple";
  # };

  # Install the driver
  services.fprintd.enable = true;

  security.pam.services.sudo.fprintAuth = true;

  services.udev.packages = [
    pkgs.yubikey-personalization
  ];

  services.pcscd.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.fwupd.enable = true;
}
