{ config, pkgs, ... }:
{
  programs.bash.enable = true;

  users.users.user = {
    isNormalUser = true;
    description = "User";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };

  users.users.bash.packages = with pkgs; [];
}
