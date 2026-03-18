{
  pkgs,
  myLib,
  ...
}:
with myLib;
{
  imports = importGen [
    ./users
    ./git
    ./my
  ];

  system.stateVersion = "25.11";
  my.nix.setup = true;
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  my.hardware.laptop.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  my.bluetooth.enable = true;

  time.timeZone = "Asia/Seoul";
  # dont use latest kernel
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "nauvis"; # Define your hostname.
  networking.networkmanager.enable = true;
  boot.extraModprobeConfig = "options iwlwifi 11n_disable=8\n";

  services.upower.enable = true;
  hardware.uinput.enable = true;
  hardware.keyboard.zsa.enable = true;

  services.printing.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  my.ime.enable = true;
  my.fonts.enable = true;
  my.core.enable = true;

  environment.systemPackages = with pkgs; [
    vulkan-tools
    pciutils

    nvtopPackages.full

    acpi
    evhz # touchpad polling rate
  ];

  programs.vim.enable = true;
  programs.neovim.enable = true;
  programs.htop.enable = true;
  programs.nix-index.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 1234 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "zxcver" ];
    };
  };

}
