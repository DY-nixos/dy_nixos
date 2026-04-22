{ config, pkgs, ... }: {

  users.users.dy = {
    isNormalUser = true;
    description = "dy";
    extraGroups = [ 
      "networkmanager" "wheel" "libvirtd" "kvm" 
      "plugdev" "storage" "disk" "video" 
      "network" "docker" "render" 
    ];
  };
}