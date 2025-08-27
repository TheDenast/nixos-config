{ inputs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/networking.nix
    ./modules/programs.nix
    inputs.home-manager.nixosModules.default
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

  security.rtkit.enable = true;

  # needed for qemu & virt-manager virtualisation
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.enable = true;

  # docker
  virtualisation.docker = {
    enable = true;
  };

  # android virtualisation
  # virtualisation.waydroid.enable = true;

  # Environment variables for proper Wayland/gamescope operation
  environment.sessionVariables = {
    # Wayland
    NIXOS_OZONE_WL = "1";
    # Ensure SDL uses Wayland when available
    SDL_VIDEODRIVER = "wayland,x11";
    # Qt wayland support
    QT_QPA_PLATFORM = "wayland;xcb";
    # Gamescope/Vulkan
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json:/run/opengl-driver-32/share/vulkan/icd.d/radeon_icd.i686.json";
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
