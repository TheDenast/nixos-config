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

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
