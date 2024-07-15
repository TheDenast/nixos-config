{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/hardware.nix
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/networking.nix
    ./modules/programs.nix
    inputs.home-manager.nixosModules.default
  ];

  # Other configurations...

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/New_York";
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

  # needed for qemu & virt-manager virtualizartion
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.enable = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
