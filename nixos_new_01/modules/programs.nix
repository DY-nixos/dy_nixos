{ config, pkgs, ... }:

{
# Install firefox.
  programs.firefox.enable = true;
# 安装  flatpak
 #services.flatpak.enable = true;
 services.udev.enable = true;
 


# 启用 virt-manager 程序
  #programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    yazi
    git
    curl
    fish
    fuzzel
    alacritty
    bibata-cursors
    capitaine-cursors
    #starship   
    #bat
    #lsd    
    nerd-fonts.jetbrains-mono
    noctalia-shell 
    nautilus
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-plugins-bad
    nautilus-open-any-terminal
    gnome-font-viewer
    ffmpegthumbnailer
    poppler
    libheif 
    webp-pixbuf-loader 
    libopenraw
    fastfetch 
    btop
    mpv
    qq   
    obs-studio
    pureref
    os-prober
    #papirus-icon-theme # 文件管理器logo
    
    imv
    gthumb
    file-roller 
    mousepad
    libnotify
    mako
    xwayland-satellite   
    polkit_gnome  
    hyprpolkitagent
    
    blender
    libwacom
 
    foliate
    kdePackages.okular
    #thunar
   
    
    #lutris
   #protonplus
  ];

# 在 configuration.nix 中启用 Docker
virtualisation.docker.enable = true;


# 启用 libvirt 服务
  #virtualisation.libvirtd = {
    #enable = true;
   # 启用 virtiofsd 支持，这会自动处理 qemu 依赖
    #qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  #};
}
