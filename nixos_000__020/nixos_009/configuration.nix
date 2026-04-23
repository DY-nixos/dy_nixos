{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

   # 镜像源配置
  nix.settings = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store?priority=10"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=5"
      "https://cache.nixos.org/"
    ];
    # 增加下载缓冲区大小
    download-buffer-size = 524288000;
  };
  boot.loader = {
    grub = {
      enable = true;
      extraEntries = ''
                menuentry "Windows" {
                    search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
                    chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
                }
            '';
    };
  };
  boot.supportedFilesystems = [ "ntfs" "exfat" "vfat" "ext4" ];
  boot.loader.timeout = -1;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = false; #主板在标准路径找启动文件 移动设备需要开启
  boot.loader.efi.canTouchEfiVariables = true; #主板根据 NVRAM 找启动文件（和上面只能二选一）
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = false; #偶尔开启一次
  boot.initrd.kernelModules = [ "pinctrl_tigerlake" ];

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable Wi-Fi support.
  networking.wireless.enable = true;  

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Enable the X11 windowing system.
  #services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "cn";
    variant = "";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dy = {
    isNormalUser = true;
    description = "dy";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "plugdev" "storage" "disk" "video" "network" "docker" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.openssh.enable = true;
  environment.systemPackages = with pkgs; [
    #vim    
  ];
   # 自动垃圾回收
 nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 30d";
 };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = true;
 
  system.stateVersion = "25.11"; # Did you read the comment?
}
