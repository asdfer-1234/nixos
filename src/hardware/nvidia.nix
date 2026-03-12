{ config, lib, ... }:
{

  config = lib.mkMerge [
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
          boot.extraModprobeConfig = ''
            # Force GPU modules to be loaded after vfio
            softdep amdgpu pre: vfio vfio_pci
            softdep i915 pre: vfio vfio_pci
            softdep nvidia pre: vfio vfio_pci
            softdep nvidia pre: i915
          '';
        };
      };
    }
  ];

}
