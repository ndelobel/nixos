{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared/default.nix
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    nvidiaSettings = false;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:1:0:0";
      nvidiaBusId = "PCI:5:0:0";
    };
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  networking.hostName = "laptop-victus";

  custom.gaming.enable = true;
  fileSystems."/home/ndelobel/Games" = {
    device = "/dev/disk/by-uuid/1c99a66f-b9d0-4bdf-b0d3-f4bf3ef79939";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  system.stateVersion = "24.11";
}
