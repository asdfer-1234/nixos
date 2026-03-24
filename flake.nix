{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-unstable";
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
        splitPath = p: path.subpath.components (path.splitRoot p).subpath;
        mkEnableModule =
          config: attrPath: value:
          let
            attrPathStringList = splitPath attrPath;
            imports = if (value ? imports) then value.imports else [ ];
            body = (removeAttrs value [ "imports" ]);
          in
          {
            inherit imports;
            options = setAttrByPath attrPathStringList {
              enable = mkEnableOption "an enable option blah";
            };
            config = mkIf (attrByPath attrPathStringList false config).enable body;
          };
      };
    in
    with myLib;
    {
      nixosConfigurations.asdfer-laptop = nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit
            myLib
            ;
          hmInputs = { inherit (inputs) qsrs kakaotalk; };
        };
        modules = [
          (nixPath ./src/hosts/asdfer-laptop)
          home-manager.nixosModules.home-manager
          { nixpkgs.overlays = [ dolphin-overlay.overlays.default ]; }
        ];
      };
    };
}
