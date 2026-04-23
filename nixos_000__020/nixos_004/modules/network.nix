{ pkgs, ... }:

{
  
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
}