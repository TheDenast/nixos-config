{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Custom boot settings
  boot.kernelPackages = pkgs.linuxPackages_6_9;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-d16b5f87-310e-4d97-9c6d-39ec9b6cd648".device = "/dev/disk/by-uuid/d16b5f87-310e-4d97-9c6d-39ec9b6cd648";

  # Existing hardware configuration content
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/c9166c90-248c-432c-8e67-255d66b92d09";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-feeb604c-b691-468e-a986-b92b42365bdc".device = "/dev/disk/by-uuid/feeb604c-b691-468e-a986-b92b42365bdc";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/50B4-A257";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/7244983e-a354-41b9-9fdb-473201a74e36"; }
  ];

  networking.useDHCP = lib.mkDefault true;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # for razer mice
  hardware.openrazer.enable = true;

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
}
