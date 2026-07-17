{ config, lib, pkgs, ... }:

let
  userDirs = builtins.attrNames (
    lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./users)
  );
in {
  imports = [
    ./hardware-configuration.nix
    ./modules/system.nix
    ./modules/audio.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/services.nix
  ] ++ map (u: ./users/${u}/system.nix) userDirs;
}
