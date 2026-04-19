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
  #programs.dconf.enable = true;  # 建议同时启用 dconf（很多 GTK 程序依赖它存储设置）
  # 可选：添加 Thunar 可能需要但会自动依赖的包（通常不需要）
  environment.systemPackages = with pkgs; [
    #polkit            # Polkit 执行包装器
  ];
}