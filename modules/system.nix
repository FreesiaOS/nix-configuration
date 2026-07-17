{ config, pkgs, inputs, ... }:
{
  # ---- Boot ----
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # ---- Nix ----
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # ---- nh (nix-helper) ----
  programs.nh = {
    enable = true;
    flake = "/home/vendinois/Projects/TheLab/TheLab-OS";
  };

  # ---- Time & Locale ----
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT    = "fr_FR.UTF-8";
    LC_MONETARY       = "fr_FR.UTF-8";
    LC_NAME           = "fr_FR.UTF-8";
    LC_NUMERIC        = "fr_FR.UTF-8";
    LC_PAPER          = "fr_FR.UTF-8";
    LC_TELEPHONE      = "fr_FR.UTF-8";
    LC_TIME           = "fr_FR.UTF-8";
  };

  # ---- AppImage ----
  environment.systemPackages = with pkgs; [
    appimage-run
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
  ];

  # ---- Other Settings ----
  system.stateVersion = "26.05";
}
