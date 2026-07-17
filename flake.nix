{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    freesiaOS-profiles.url = "github:FreesiaOS/profiles";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = { nixpkgs, freesiaOS-profiles, zen-browser, ... } @inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        freesiaOS-profiles.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}
