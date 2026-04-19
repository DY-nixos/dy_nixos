{config, lib, pkgs, ...}: 

{
  boot.kernelModules = [ 
    "coretemp" #—— CPU 的温度计
    "nct6683"  #—— 主板的“管家”驱动
  ];
  # 开启 sysprof 服务，这是 Mission Center 获取数据的关键
  services.sysprof.enable = true;
  # ========== 系统包安装 ==========
  environment.systemPackages = with pkgs; [
    mission-center #类似win11的任务管理器，强烈推荐
    lm_sensors    #lm_sensors，让系统能正式识别你的传感器
  ];
}