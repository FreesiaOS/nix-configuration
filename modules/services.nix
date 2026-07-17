{ config, pkgs, ... }:
{
  # Automount of external storage
  services.devmon.enable = true;

  # GUI auth prompts
  security.polkit.enable = true;
}
