{ ... }:

{
  imports = [
    ./modules/packages
    ./modules/services.nix
    ./modules/users.nix
    ./modules/networking.nix
    ./modules/programs.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.optimise.automatic = true;

  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  system.autoUpgrade = {
    enable = true;
    flake = "/home/denast/.nixos-config#framework-13";
    operation = "boot";
    allowReboot = false;
    dates = "02:00";
  };

  time.timeZone = "Asia/Yerevan";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  boot.tmp.cleanOnBoot = true;

  security.rtkit.enable = true;
  security.polkit.enable = true;

  # needed for qemu & virt-manager virtualisation
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.nix-ld.enable = true;

  # Environment variables for proper Wayland/gamescope operation
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    SDL_VIDEODRIVER = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json:/run/opengl-driver-32/share/vulkan/icd.d/radeon_icd.i686.json";
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
