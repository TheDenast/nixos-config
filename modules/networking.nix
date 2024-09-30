{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443 53317];
    allowedUDPPorts = [53317];
  };

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  services.tailscale = {
    enable = true;
  };

  programs.openvpn3.enable = true;
}
