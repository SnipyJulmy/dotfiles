{ config, pkgs, ... }:

let
  unstable = import <unstable> { };
in

{
  home.username = "snipy";
  home.homeDirectory = "/home/snipy";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.age
    pkgs.bat
    pkgs.conky
    pkgs.curl
    pkgs.eza
    pkgs.fastfetch
    pkgs.fd
    pkgs.gh
    pkgs.ghostty
    pkgs.gnutar
    pkgs.gzip
    pkgs.htop
    pkgs.jira-cli-go
    pkgs.jq
    pkgs.lazydocker
    pkgs.lazygit
    pkgs.pass
    pkgs.polybar
    pkgs.ripgrep
    pkgs.ungoogled-chromium
    pkgs.unzip
    pkgs.xclip
    pkgs.yazi
    pkgs.yubikey-manager
    pkgs.yubikey-manager-qt
    pkgs.zellij
    pkgs.zk

    unstable.k9s
    unstable.chezmoi
    unstable.rofi
    unstable.tree-sitter
    unstable.eww
  ];

  programs.git = {
    enable = true;
  };

  programs.starship = {
    enable = false;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
        vicmd_symbol = "[λ](bold blue)";
      };
    };
  };

  home.file = { };

  home.sessionVariables = { };

  programs.home-manager.enable = true;
}
