{
  description = "NixOS multi-host configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell.url = "git+https://git.outfoxxed.me/quickshell/quickshell";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    hostSystem = "x86_64-linux";
    lib = nixpkgs.lib;

    # 递归加载目录下所有 .nix 文件（排除 disabled）
    loadModulesFrom = path:
      if builtins.pathExists path then
        let
          entries = builtins.attrNames (builtins.readDir path);
          nixFiles = builtins.filter (f: 
            lib.hasSuffix ".nix" f && f != "disabled"
          ) entries;
        in
        map (f: path + "/${f}") nixFiles
      else [];

    # 递归加载所有子目录的模块
    loadAllModules = basePath:
      if builtins.pathExists basePath then
        let
          entries = builtins.attrNames (builtins.readDir basePath);
          dirs = builtins.filter (d: 
            builtins.pathExists (basePath + "/${d}") &&
            builtins.isAttrs (builtins.readDir (basePath + "/${d}"))
          ) entries;
        in
        builtins.concatMap (d: loadModulesFrom (basePath + "/${d}")) dirs
      else [];

    # 加载系统模块
    systemModules = loadAllModules ./modules;

    # 获取有效用户列表
    validUsers = 
      if builtins.pathExists ./users then
        builtins.filter (name:
          let userPath = ./users + "/${name}";
          in builtins.pathExists userPath && builtins.isAttrs (builtins.readDir userPath)
        ) (builtins.attrNames (builtins.readDir ./users))
      else [];

    # 构建用户配置
    userConfigs = 
      if validUsers != [] then
        builtins.listToAttrs (map (username: {
          name = username;
          value = { config, pkgs, ... }: {
            imports = loadModulesFrom (./users + "/${username}");
          };
        }) validUsers)
      else {
        # 保底配置
        dy = { config, pkgs, ... }: {
          # 基础配置，确保 Home Manager 不会失败
          home.stateVersion = "26.05";
          programs.home-manager.enable = true;
        };
      };

    # 构建单个主机配置
    mkHost = hostName: hostConfig:
      lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          hostConfig
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users = userConfigs;
            };
          }
        ] ++ systemModules;
      };
  in
  {
    nixosConfigurations.dynx = mkHost "dynx" ./hosts/dynx/configuration.nix;
    nixosConfigurations.dynix = mkHost "dynix" ./hosts/dynix/configuration.nix;
  };
}