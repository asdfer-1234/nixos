{
  ...
}:
{
  home-manager.extraSpecialArgs = {
    configDirectory = "/etc/nixos";
  };
  home-manager.useUserPackages = true;
  home-manager.users.asdfer = ./users/asdfer/home.nix;
  home-manager.users.zxcver = ./users/zxcver/home.nix;
}
