{
  config,
  lib,
  modulesPath,
  myLib,
  ...
}:
{
  imports = myLib.importGen [
    (modulesPath + "/installer/scan/not-detected")
    ./nvidia
    # ./b550-suspend-fix # DOESN'T WORK
    # ./logitech/logid # TIMES OUT TRYING TO GET DEVICE NAME
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS";
    fsType = "btrfs";
    options = [
      "noatime"
      "compress=zstd"
    ];
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
    options = [
      "dmask=0077"
      "fmask=0077"
    ];
  };

  swapDevices = [ { device = "/dev/disk/by-label/SWAP"; } ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
