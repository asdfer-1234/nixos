{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qsrs = {
      url = "git+file:/home/asdfer/newp/qsrs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      qsrs,
      ...
    }@inputs:
    {
      nixosConfigurations.nauvis = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs qsrs;
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
