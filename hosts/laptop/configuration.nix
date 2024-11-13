{config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  # boot loader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      theme = null;
    };
  };

  # graphics
  boot.kernelParams = ["nvidia_drm.modeset=1"];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
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
  services.xserver.videoDrivers = ["amdgpu" "nvidia"];

  # network
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  system.stateVersion = "24.05";
}
