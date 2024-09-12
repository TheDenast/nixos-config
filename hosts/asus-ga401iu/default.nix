{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    # Add any other ASUS-specific modules here
  ];
  networking.hostName = "denastG14";

  # Add any ASUS-specific configurations here
}
