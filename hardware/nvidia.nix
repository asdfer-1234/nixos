{ config, lib, ... }:
{

  config = lib.mkMerge [
    (lib.mkIf (config.specialisation != { }) {
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
    })
    {
      specialisation = {
        offload.configuration = {
          system.nixos.tags = [ "nouveau" ];

          # Disable nvidia but not nouveau
          boot.blacklistedKernelModules = [
            "nvidia"
            "nvidiafb"
            "nvidia-drm"
            "nvidia-uvm"
            "nvidia-modeset"
          ];
        };
      };
    }
  ];

}
