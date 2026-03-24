{
  config,
  lib,
  ...
}:
with lib;
{
  hardware.enableRedistributableFirmware = true;
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ehci_pci"
    "ata_piix"
    "usb_storage"
    "sd_mod"
  ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModprobeConfig = "softdep i915 pre: vfio vfio_pci";

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
  boot.kernelParams = [ "libata.force=1.00:disable" ];

  # Disable nvidia including nouveau
  boot.blacklistedKernelModules = [
    "nvidia"
    "nvidiafb"
    "nvidia-drm"
    "nvidia-uvm"
    "nvidia-modeset"
    "nouveau"
  ];
}
