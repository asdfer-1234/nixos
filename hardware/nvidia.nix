{ config, lib, ... }:
{

  config = lib.mkMerge [
    {
      hardware.graphics.enable = true;
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
        offload.enable = true;
      };
    }
    (lib.mkIf (config.specialisation != { }) {
      system.nixos.tags = [ "dGPU-only" ];
      boot.kernelParams = [ "module_blacklist=i915" ];
    })
    {
      specialisation = {
        offload.configuration = {
          system.nixos.tags = [ "iGPU-with-offload" ];
          hardware.nvidia.prime = {
            offload.enable = lib.mkForce true;
          };
        };
      };
    }
  ];

}
