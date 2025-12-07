{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      53317
    ];
    allowedUDPPorts = [ 53317 ];
  };

  # services.mullvad-vpn = {
  #   enable = true;
  #   package = pkgs.mullvad-vpn;
  # };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  services.openvpn.servers = {
    amplified = {
      config = ''config /home/denast/.secrets/amplified_vpn.conf '';
      updateResolvConf = true;
      autoStart = false;
    };
  };
}
