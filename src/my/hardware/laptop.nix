{
  config,
  lib,
  ...
}:
with lib;
{
  options.my.hardware.laptop.enable = mkEnableOption "";

  config = lib.mkIf config.my.hardware.laptop.enable lib.mkMerge [
    {
      boot.extraModprobeConfig = "softdep i915 pre: vfio vfio_pci";
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
    (lib.mkIf (config.specialisation != { }) {

      system.nixos.tags = [ "igpu" ];

      # Disable nvidia including nouveau
      boot.blacklistedKernelModules = [
        "nvidia"
        "nvidiafb"
        "nvidia-drm"
        "nvidia-uvm"
        "nvidia-modeset"
        "nouveau"
      ];

    })
    {
      specialisation = {
        nvidia.configuration = {
          system.nixos.tags = [ "nvidia" ];
          #boot.kernelParams = [ "module_blacklist=i915" ];
          boot.kernelParams = [ "pcie_aspm=off" ];

          services.xserver.videoDrivers = [
            "modesetting"
            "nvidia"
          ];
          hardware.nvidia.open = true;

          # Intel: 0000:00:02:0
          # NVIDIA: 0000:01:00:0
          hardware.nvidia.prime = {
            intelBusId = "PCI:0@0:2:0";
            nvidiaBusId = "PCI:1@0:0:0";
          };
          environment.variables = {
            NIXOS_SPECIALISATION = "nvidia";
          };
          boot.extraModprobeConfig = "softdep nvidia pre: vfio vfio_pci";
        };
      };
    }
  ];
}
