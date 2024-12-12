{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    # Add any other Framework-specific modules here
  ];
  networking.hostName = "dFW13";

  # Add any Framework-specific configurations here
}
