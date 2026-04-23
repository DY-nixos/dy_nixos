{ config, pkgs, lib, ... }: {

  # Enable NetworkManager for managing network connections.
  networking.networkmanager.enable = true;

  # Clash proxy service
  environment.systemPackages = [
      pkgs.clash-verge-rev
   ];
   # Clash Verge configuration
   programs.clash-verge= {
     enable = true;
     autoStart = true;   
     serviceMode = true;
     tunMode = true; 
   };

 # Proxy
      networking.proxy.default = "http://127.0.0.1:7897/";
      networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  #services.mihomo = {
    #  enable = true;
    #  tunMode = true;
     # configFile = "/home/dy/.local/share/io.github.clash-verge-rev.clash-verge-rev/clash-verge.yaml";
     #webui = pkgs.metacubexd;
   #};

  #Avahi for local network service discovery
  services.avahi = {
     enable = true;
     nssmdns4 = true;
    publish = {
        enable = true;
        domain = true;
        userServices = true;
    };
     openFirewall = true;
  };
  
  # 开启防火墙
  networking.firewall.enable = true;

  # 允许以下端口通过防火墙
  # 11434 是 Ollama 的通信端口
  # 3000 是 Open WebUI 的访问端口
  networking.firewall.allowedTCPPorts = [ 11434 3000 ];

  # 建议同时信任 Docker 的网桥接口，这样最稳妥
  networking.firewall.trustedInterfaces = [ "docker0" ];
}