{ config, pkgs, ... }: {
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
  };

  hardware.nvidia = {
    open = true;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "";
      nvidiaBusId = "";
    };
  };

  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  networking.hostName = "laptop-victus";

  system.stateVersion = "24.11";
}
