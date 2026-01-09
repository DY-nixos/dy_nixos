{ config, pkgs, ... }:

{
# Install firefox.
  programs.firefox.enable = true;

# 安装  flatpak
 #services.flatpak.enable = true;
  
# 启用 virt-manager 程序
  #programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    yazi
    git
    fish
    noctalia-shell
    clash-verge-rev   
    kitty
    fastfetch 
    btop
    mpv
    qq
    gvfs
    thunar
    file-roller 
    clash-verge-rev
    mousepad
    noctalia-shell
    thunar-archive-plugin
    udisks
    xwayland-satellite
  
    #starship
    #waybar
    #cmatrix1  
    #obsidian

    #bat
    #lsd    
   #nerd-fonts.jetbrains-mono
    #helix
    #waypaper
    #libnotify
      #wireguard-tools
     # swww
     #poppler
    #nautilus
    #mako
    #polkit_gnome 
    #swaylock-effects
   #swayidle
    #wf-recorder
    #matugen     
    #ffmpegthumbnailer
    #tumbler
  ];


# 启用 libvirt 服务
  #virtualisation.libvirtd = {
    #enable = true;
   # 启用 virtiofsd 支持，这会自动处理 qemu 依赖
    #qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  #};
}
