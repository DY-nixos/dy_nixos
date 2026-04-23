{
  description = "NixOS configuration with modular structure";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell.url = "git+https://git.outfoxxed.me/quickshell/quickshell";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
  };

  outputs = { self, nixpkgs, home-manager,  ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    
    # 递归加载目录下所有 .nix 文件（排除 disabled）
    loadModulesFrom = path:
      if builtins.pathExists path then
        let
          entries = builtins.attrNames (builtins.readDir path);
          filtered = builtins.filter (e: e != "disabled") entries;
          nixFiles = builtins.filter (f: lib.hasSuffix ".nix" f) filtered;
        in
        map (f: path + "/${f}") nixFiles
      else [];
    
    # 递归加载所有子目录的模块
    loadAllModules = basePath:
      if builtins.pathExists basePath then
        let
          dirs = builtins.attrNames (builtins.readDir basePath);
          validDirs = builtins.filter (d: 
            builtins.isAttrs (builtins.readDir (basePath + "/${d}"))
          ) dirs;
        in
        builtins.concatMap (d: loadModulesFrom (basePath + "/${d}")) validDirs
      else [];

    # 加载系统模块
    systemModules = loadAllModules ./modules;
    
    # 加载用户的所有 home-manager 配置模块
    loadUserModules = username: let
      userPath = ./users/${username};
    in
      if builtins.pathExists userPath then
        loadModulesFrom userPath
      else [];
    
    # 为每个用户构建 home-manager 配置
    mkHomeConfig = username: {
      ${username} = { config, pkgs, ... }: {
        imports = loadUserModules username;
      };
    };
    
    # 获取 users 目录下所有子目录（即用户名）
    userDirs = builtins.attrNames (builtins.readDir ./users);
    validUsers = builtins.filter (name: 
      builtins.pathExists (./users/${name}) && 
      builtins.isAttrs (builtins.readDir (./users/${name}))
    ) userDirs;
    
    # 构建所有用户的配置
    users = builtins.foldl' (acc: username: 
      acc // (mkHomeConfig username)
    ) {} validUsers;
    
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