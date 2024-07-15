{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/hardware.nix
    inputs.home-manager.nixosModules.default
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/networking.nix
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
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime.sync.enable = true;
    prime.nvidiaBusId = "PCI:1:0:0";
    prime.amdgpuBusId = "PCI:4:0:0";
  };
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hermit" "JetBrainsMono" ]; })
    font-awesome
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
