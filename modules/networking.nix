{ ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "denastG14";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443 53317];
    allowedUDPPorts = [53317];
  };
}
