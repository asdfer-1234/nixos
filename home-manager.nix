{ config, ... }:
{
  home-manager.extraSpecialArgs = rec {
    configDirectory = "/etc/nixos/";
    link = path: config.lib.file.mkOutOfStoreSymlink "${configDirectory}${path}";
  };

  home-manager.useUserPackages = true;
  home-manager.users.asdfer = ./users/asdfer/home.nix;
  home-manager.users.zxcver = ./users/zxcver/home.nix;
}
