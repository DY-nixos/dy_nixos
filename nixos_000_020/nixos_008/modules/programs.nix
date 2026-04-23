{ config, pkgs, lib, ... }: {

  #推荐方式
  programs.firefox.enable = true;       # 系统集成
  programs.vim.enable = true;
  programs.git.enable = true;           # 自动配置 + bash补全
  programs.fish.enable = true;          # 完整 shell 环境
  programs.yazi.enable = true;    

  # ========== 系统包安装 ==========
  environment.systemPackages = with pkgs; [
    alacritty
    wget
    curl
    fuzzel
    btop
    fastfetch 
    tree
    #breeze-cursors  # 强烈推荐breeze光标主题  nixos仓库暂时没找到

    bibata-cursors    # Bibata 光标主题（现代风格）
    capitaine-cursors    # Capitaine 光标主题（macOS 风格）
    nerd-fonts.jetbrains-mono  # JetBrains Mono 字体 + 编程图标
    gnome-font-viewer     # GNOME 字体查看器
    ffmpegthumbnailer   # 视频文件缩略图生成器
    poppler     # PDF 文件渲染库（支持 PDF 缩略图）
    libheif    #HEIF/HEIC图像格式支持（苹果手机照片）
    webp-pixbuf-loader   # WebP 图像格式支持
    libopenraw    # 相机 RAW 格式支持（.cr2, .nef 等）
    mission-center  #类似win11的任务管理器，强烈推荐
    mpv   # 轻量级视频播放器
    #qq  
    #waybar
    #awww   
    #waypaper
    #matugen
    #cava
    #cliphist     #提供剪贴板历史记录功能
    #wl-clipboard #是wayland合成器标配剪贴板工具
    #grim #截图工具
    #slurp #选取区域工具
    #satty #编辑截图
    #wf-recorder  #录屏
    #swayidle
    #swaylock-effects
    obs-studio
    #libreoffice
    #librecad
    pureref     # 参考图管理工具（设计/绘画用）
    os-prober    # 操作系统检测工具（用于双系统引导） 
    papirus-icon-theme   # Papirus 图标主题
    #adwaita-icon-theme   # GNOME 默认图标主题
    #imv   # 轻量级命令行图像查看器（Wayland 原生）
    loupe
    #gthumb    # GNOME 图像查看器和管理器
    file-roller   # GNOME 压缩文件管理器（支持 zip/rar 等）
    mousepad    # XFCE 轻量级文本编辑器
    xwayland-satellite    # XWayland 独立运行工具
    libnotify       # 通知发送库（命令行发送通知）
    mako            # Wayland 原生通知守护进程
    #polkit_gnome    # Polkit 认证代理（GNOME 版本）
    #hyprpolkitagent # Hyprland Polkit 认证代理
    
    blender      # 3D 建模/动画/渲染软件
    libwacom     # Wacom 数位板支持库
    
    foliate            # 现代电子书阅读器（支持 epub, mobi 等）
    #kdePackages.okular  # KDE 全能文档查看器（PDF, 图片等）
    
    # lutris       # 游戏管理器（支持多种平台）
    # protonplus   # Proton 游戏兼容层管理工具
  ];
   # 在 configuration.nix 中启用 Docker
   #virtualisation.docker.enable = true;
   # 启用 virt-manager 虚拟机管理程序
   #programs.virt-manager.enable = true;
  # ========== libvirt 虚拟化 ==========
  # 启用 libvirt 服务（KVM/QEMU 管理）
  # virtualisation.libvirtd = {
  #   enable = true;
  #   # 启用 virtiofsd 支持，这会自动处理 qemu 依赖
  #   qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  # };
}
