{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  users.users.asdfer = {
    isNormalUser = true;
    description = "the main user with sudo privileges";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [
      pkgs.neovim
      pkgs.nixd
      pkgs.nil
      pkgs.thunderbird
      pkgs.git
      pkgs.vim
      pkgs.rustup
      pkgs.vulkan-tools
      pkgs.clang
      pkgs.alacritty
      pkgs.fuzzel
    ];
  };

  programs.niri.enable = true;
  xdg.portal.enable = true;
  xdg.portal.config = {
    common = {
      default = [ "kde" ];
    };
  };

  users.users.zxcver = {
    isNormalUser = true;
    description = "other user without sudo";
    extraGroups = [ "networkmanager" ];
    packages = [
    ];
  };
}
