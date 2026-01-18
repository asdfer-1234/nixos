{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
  };
  outputs =
    { self, nixpkgs, ... }:
    {
      nixosConfigurations.asdfhost = nixpkgs.lib.nixosSystem {
        modules = [ ./configuration.nix ];
      };
    };
}
