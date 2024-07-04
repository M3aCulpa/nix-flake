{config, pkgs, ...}: {
  home.packages = with pkgs; [
    flameshot
    openssh
    ripgrep
    gnumake
    gnutar
    gnupg
    wget
    tree
    jq
    yq
  ];

  programs = {
    # zoxide is a smarter cd command, inspired by z and autojump.
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # atuin replaces existing shell history with a SQLite database and syncs it across all your shells.
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # a cat clone with syntax highlighting and Git integration.
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "catppuccin-mocha";
      };
    };
  };
}
