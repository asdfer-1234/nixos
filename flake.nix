{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qsrs.url = "git+file:/home/asdfer/personal/proj/qsrs";
    kakaotalk = {
      url = "github:anaclumos/kakaotalk.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dolphin-overlay.url = "github:rumboon/dolphin-overlay";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
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
      nixosConfigurations =
        let
          makeSystem =
            { system, module }:
            nixosSystem {
              inherit system;
              specialArgs =
                let
                  pkgs-stable = import nixpkgs-stable {
                    inherit system;
                    config.allowUnfree = true;
                  };
                in
                {
                  inherit
                    myLib
                    pkgs-stable
                    ;
                  hmInputs = { inherit (inputs) qsrs kakaotalk; };
                };
              modules = [
                module
                home-manager.nixosModules.home-manager
                { nixpkgs.overlays = [ dolphin-overlay.overlays.default ]; }
              ];
            };
        in
        {
          asdfer-laptop = makeSystem {
            system = "x86_64-linux";
            module = (nixPath ./src/hosts/asdfer-laptop);
          };
          asdfer-homelab = makeSystem {
            system = "x86_64-linux";
            module = (nixPath ./src/hosts/asdfer-homelab);
          };
        };

    };
}
