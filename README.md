# FreesiaOS - Nix Configuration

This is the NixOS configuration for the NixOS based FreesiaOS distribution.

The goals behind this project is to try and provide an easy to use NixOS based system for users coming from other non Nix based OS (Windows, macOS, or other linux distributions).

The initial idea to try and reach that goal is to provide the following:

- A modular Nix configuration (this repository)
- A Nix module that allows enabling currated system settings based on common user profiles ([Profiles repository](https://github.com/FreesiaOS/profiles))
- A set of GUI applications to manage that modular nix configuration + profiles + package installation. This work may or may not reuse existing projects trying to adress those same topics.
