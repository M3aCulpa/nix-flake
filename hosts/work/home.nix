{ config, pkgs, inputs, ... }:

{
  imports = [
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "johnathanbenge";
    homeDirectory = "/Users/johnathanbenge";
    file.".zshrc".text = ''
      autoload -U compinit && compinit
    '';
    stateVersion = "23.11"; 
    packages = with pkgs; [

      # General packages for development and system management
      gh
      git
      go
      istioctl
      jq
      killall
      kubectl
      kubernetes-helm
      neofetch
      nodePackages.pnpm
      unixtools.watch
      openssh
      pandoc
      pgformatter
      postgresql_15
      python310
      qemu
      ripgrep
      terraform
      trivy
      vscode
      wget
      zip

      # Encryption and security tools
      awscli2
      gnupg
      libfido2
      pinentry
      yubikey-agent
      yubikey-manager
      _1password-gui

      # Media-related packages
      flameshot
      spotify
      slack

      # Text and terminal utilities
      htop
      hunspell
      iftop
      tmux
      tree
      unrar
      unzip

      # Container management and cloud tools
      docker
      docker-compose
      ngrok
      podman
      tflint

      # Miscellaneous development tools
      actionlint
      argocd
      natscli
    ];
  };

  programs.ssh = {
    enable = true;
    extraOptionOverrides = {
      AddKeysToAgent = "yes";
      IdentitiesOnly = "yes";
      UseKeychain = "yes";
    };
  };

  programs.home-manager.enable = true;
}
