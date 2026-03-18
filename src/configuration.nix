{
  pkgs,
  inputs,
  qsrs,
  myLib,
  ...
}:
{
  imports = myLib.importGen [
    ./hardware
    ./users
    ./ime
    ./git
    ./my
  ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    settings = {
      keep-outputs = true;
      keep-derivations = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  security.polkit.enable = true;

  # dont use latest kernel
  boot.kernelPackages = pkgs.linuxPackages;
  boot.extraModprobeConfig = "options iwlwifi 11n_disable=8\n";

  networking.hostName = "nauvis"; # Define your hostname.
  networking.networkmanager.enable = true;

  services.upower.enable = true;
  hardware.uinput.enable = true;
  # services.udev.extraRules = ''
  #   SUBSYSTEM=="misc", KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  # '';

  hardware.keyboard.zsa.enable = true;

  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  my.fonts.enable = true;

  environment.systemPackages = with pkgs; [
    vulkan-tools
    pciutils
    tldr
    cbonsai
    cpufetch
    cowsay
    fastfetch
    neofetch
    killall
    ramfetch
    sl
    nvtopPackages.full
    trashy
    nvfetcher
    p7zip
    ranger
    ripgrep
    yt-dlp
    acpi
    evhz # touchpad polling rate
    tree
  ];
  programs.vim.enable = true;
  programs.neovim.enable = true;
  programs.htop.enable = true;
  programs.nix-index.enable = true;
  system.stateVersion = "25.11";

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
