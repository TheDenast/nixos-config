{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    # Add any other Framework-specific modules here
  ];
  networking.hostName = "denastFW13";

  # Add any Framework-specific configurations here
}
