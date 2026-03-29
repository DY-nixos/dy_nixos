{
  description = "NixOS configuration with auto-module loading";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell.url = "git+https://git.outfoxxed.me/quickshell/quickshell";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    
    # 递归加载模块目录中的所有 .nix 文件
    loadModulesFrom = path:
      if builtins.pathExists path then
        let
          files = builtins.attrNames (builtins.readDir path);
          nixFiles = builtins.filter (f: lib.hasSuffix ".nix" f) files;
        in
        map (f: path + "/${f}") nixFiles
      else [];
    
    # 加载系统模块
    systemModules = loadModulesFrom ./modules;
    
    # 加载用户配置（如果存在）
    loadUserConfig = username: let
      configPath = ./users + "/${username}.nix";
    in
      if builtins.pathExists configPath then import configPath else {};
    
    # 定义用户列表
    users = {
      #dy = loadUserConfig "dy";
       #root = loadUserConfig "root";
    };
    
  in {
    nixosConfigurations.nixos = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users = users;
          };
        }
      ] ++ systemModules;
    };
  };
}