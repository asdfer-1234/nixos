{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qsrs.url = "git+file:/home/asdfer/personal/proj/qsrs";
    kakaotalk = {
      url = "github:asdfer-1234/kakaotalk.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dolphin-overlay.url = "github:rumboon/dolphin-overlay";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      qsrs,
      kakaotalk,
      dolphin-overlay,
      ...
    }@inputs:
    with nixpkgs.lib;
    let
      system = "x86_64-linux";
      myLib = {
        importGen = imports: forEach imports nixPath;
        nixPath = p: (if (pathIsDirectory p) then p else (p + ".nix"));
      };
    in
    {
      nixosConfigurations.nauvis = nixosSystem {
        inherit system;
        specialArgs = {
          inherit
            inputs
            qsrs
            kakaotalk
            myLib
            ;
        };
        modules = [
          ./src/configuration.nix
          home-manager.nixosModules.home-manager
          { nixpkgs.overlays = [ dolphin-overlay.overlays.default ]; }
        ];
      };
    };
}
