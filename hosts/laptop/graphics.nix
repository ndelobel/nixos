{ config, ... }:
{
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  # nvidia
  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    nvidiaSettings = true;
    modesetting.enable = false;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
