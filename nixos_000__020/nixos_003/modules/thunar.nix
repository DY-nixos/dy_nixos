{ config, pkgs, ... }:

{
  # Thunar 文件管理器配置
  # 支持 USB 和手机 MTP 连接
  
  # 启用 Thunar 及插件
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman      # USB/手机自动挂载支持（MTP 必需）
      thunar-archive-plugin  # 压缩文件右键菜单
    ];
  };
  
  # 保存 Thunar 设置（侧边栏、视图等）
  programs.xfconf.enable = true;
  
  # 必需的后端服务
  services.gvfs.enable = true;      # 提供 MTP、回收站等功能（自动包含 MTP 支持）
  services.udisks2.enable = true;   # 存储设备管理
  services.tumbler.enable = true;   # 图片/视频缩略图生成
  
  # Polkit 认证（用于权限对话框）
  security.polkit.enable = true;
  
  # 可选：添加 Thunar 可能需要但会自动依赖的包（通常不需要）
  # environment.systemPackages = with pkgs; [
  #   # libmtp 会自动被 gvfs 依赖，无需手动添加
  # ];
}