{ config, lib, pkgs, ... }:
{

  boot.kernelParams = [
    # NVIDA不再默认加载kernel mode setting,
    # 显式开启它确保 Wayland compositors function properly.
    "nvidia-drm.fbdev=1"
  ];

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    # 解决nvidia-container的bug
    enable32Bit = true;
  };

  # 开启NVIDIA容器支持
  hardware.nvidia-container-toolkit.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required.解决wayland compositors的bug
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
