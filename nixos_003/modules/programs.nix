{ config, pkgs, ... }:

{
# Install firefox.
  programs.firefox.enable = true;

# 安装 flatpak（沙盒应用管理）
  # services.flatpak.enable = true;

  # 启用 udev 设备管理服务（处理 USB 设备、硬件热插拔等）
  services.udev.enable = true;

# 启用 virt-manager 虚拟机管理程序
  #programs.virt-manager.enable = true;

  # ========== 系统包安装 ==========
  environment.systemPackages = with pkgs; [
    vim
    wget
    yazi
    git
    curl
    btop
    fish
    fuzzel
    alacritty
    fastfetch 
    tree
    bibata-cursors
    capitaine-cursors
    nerd-fonts.jetbrains-mono  # JetBrains Mono 字体 + 编程图标
    gnome-font-viewer     # GNOME 字体查看器
    ffmpegthumbnailer   # 视频文件缩略图生成器
    poppler     # PDF 文件渲染库（支持 PDF 缩略图）
    libheif    #HEIF/HEIC图像格式支持（苹果手机照片）
    webp-pixbuf-loader   # WebP 图像格式支持
    libopenraw    # 相机 RAW 格式支持（.cr2, .nef 等）

    mpv   # 轻量级视频播放器
    qq   
    obs-studio
    pureref     # 参考图管理工具（设计/绘画用）
    os-prober    # 操作系统检测工具（用于双系统引导）


    papirus-icon-theme   # Papirus 图标主题
    #adwaita-icon-theme   # GNOME 默认图标主题
  
    
    imv   # 轻量级命令行图像查看器（Wayland 原生）
    gthumb    # GNOME 图像查看器和管理器
    file-roller   # GNOME 压缩文件管理器（支持 zip/rar 等）
    mousepad    # XFCE 轻量级文本编辑器
    xwayland-satellite    # XWayland 独立运行工具

   libnotify       # 通知发送库（命令行发送通知）
    mako            # Wayland 原生通知守护进程
    polkit_gnome    # Polkit 认证代理（GNOME 版本）
    hyprpolkitagent # Hyprland Polkit 认证代理
    
    blender      # 3D 建模/动画/渲染软件
    libwacom     # Wacom 数位板支持库
    
    foliate            # 现代电子书阅读器（支持 epub, mobi 等）
    kdePackages.okular  # KDE 全能文档查看器（PDF, 图片等）
    
    # lutris       # 游戏管理器（支持多种平台）
    # protonplus   # Proton 游戏兼容层管理工具
  ];

# 在 configuration.nix 中启用 Docker
virtualisation.docker.enable = true;


  # ========== libvirt 虚拟化 ==========
  # 启用 libvirt 服务（KVM/QEMU 管理）
  # virtualisation.libvirtd = {
  #   enable = true;
  #   # 启用 virtiofsd 支持，这会自动处理 qemu 依赖
  #   qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  # };
}
