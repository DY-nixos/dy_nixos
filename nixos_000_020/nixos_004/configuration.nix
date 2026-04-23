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
    device = "nodev";
    efiSupport = true;
    useOSProber = false;#偶尔开启一次
    
    extraEntries = ''
      menuentry "Arch Linux" {
        search --fs-uuid f8a9c7a0-896b-4e6b-859e-5c55e6f0fe1d --set=root
        linux /@/boot/vmlinuz-linux root=UUID=f8a9c7a0-896b-4e6b-859e-5c55e6f0fe1d rw rootflags=subvol=@
        initrd /@/boot/initramfs-linux.img
      }
    '';
  };
  timeout = -1;
  efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };
};


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
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "cn";
    variant = "";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
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
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "plugdev" "storage" "disk" "video" "network" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
      services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
      networking.firewall.enable = true;
 
  system.stateVersion = "25.11"; # Did you read the comment?
}
