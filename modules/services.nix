{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = false;

  services.displayManager.sddm.package = pkgs.kdePackages.sddm;
  services.displayManager.sddm = {
    enable = true;
    extraPackages = with pkgs; [qt6.qt5compat];
    theme = "where_is_my_sddm_theme";
 };

  # Needed for secret saving on hyprland
  services.gnome.gnome-keyring.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [
#    "nvidia"
    "amdgpu"
  ];

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.blueman.enable = true;

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
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  services.syncthing = {
    enable = true;
    user = "denast";
    configDir = "/home/denast/.config/syncthing";
  };

  # Fingerprint reader stuff
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };

  # Install the driver
  services.fprintd.enable = true;

  # services.supergfxd.enable = true;

  # services.asusd = {
  #   enable = true;
  #   enableUserService = true;
  # };

  services.udev.packages = [
    # (pkgs.writeTextFile {
    #   name = "49-stlinkv2.rules";
    #   destination = "/etc/udev/rules.d/49-stlinkv2.rules";
    #   text = ''
    #     SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", GROUP="users", MODE="0666"
    #   '';
    # })
    pkgs.nrf-udev
    pkgs.segger-jlink
  ];
}
