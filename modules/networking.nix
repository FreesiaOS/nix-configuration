{ config, pkgs, ... }:
{
  networking = {
    hostName = "nixos";
    nameservers = [ "1.1.1.1" ];
    networkmanager = {
      enable = true;
      dns = "none";
    };
    firewall.enable = true;
  };
}
