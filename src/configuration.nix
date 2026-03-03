{
  pkgs,
  lib,
  inputs,
  qsrs,
  ml,
  ...
}:
{
  imports = ml.importGen [
    ./hardware
    ./users
    ./theStrugglesOfKoreanLinux
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
  networking.networkmanager.dhcp = "dhcpcd";

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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    maple-mono.truetype
    fira
    cascadia-code
    source-code-pro
    input-fonts
    nanum
    nanum-gothic-coding
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    terminus_font
  ];
  nixpkgs.config.input-fonts.acceptLicense = true;

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
  ];

  programs.git.enable = true;
  programs.vim.enable = true;
  programs.neovim.enable = true;
  programs.htop.enable = true;
  programs.nix-index.enable = true;
  system.stateVersion = "25.11";

  home-manager = {
    useUserPackages = true;
    users.asdfer = ./users/asdfer;
    users.zxcver = ./users/zxcver;
    extraSpecialArgs = { inherit inputs qsrs ml; };
  };

}
