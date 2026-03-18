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
      dolphin-overlay,
      ...
    }@inputs:
    with nixpkgs.lib;
    let
      myLib = rec {
        nixPath = p: (if (pathIsDirectory p) then p else (p + ".nix"));
        importGen = imports: forEach imports nixPath;
      };
    in
    {
      nixosConfigurations.nauvis = nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit
            myLib
            ;
          hmInputs = { inherit (inputs) qsrs kakaotalk; };
        };
        modules = [
          ./src/configuration.nix
          home-manager.nixosModules.home-manager
          { nixpkgs.overlays = [ dolphin-overlay.overlays.default ]; }
        ];
      };
    };
}
