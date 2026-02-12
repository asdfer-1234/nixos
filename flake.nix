{
  inputs = {
    nixpkgs.url = "github:numtide/nixpkgs-unfree?ref=nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qsrs.url = "git+file:/home/asdfer/personal/proj/qsrs";
    kakaotalk.url = "github:anaclumos/kakaotalk.nix";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      qsrs,
      kakaotalk,
      ...
    }@inputs:
    with nixpkgs.lib;
    {
      nixosConfigurations.nauvis = nixosSystem {
        specialArgs = {
          inherit
            inputs
            qsrs
            kakaotalk
            ;
          ml.importGen = imports: forEach imports (p: (if ((pathIsDirectory p)) then p else (p + ".nix")));
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
