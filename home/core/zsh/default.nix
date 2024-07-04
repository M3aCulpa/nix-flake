{pkgs, ...}: let
  shellAliases = {
    vim = "nvim";
    cat = "bat";
    ls = "exa";
    grep = "rg";
  };

  sessionPath = [
    "$HOME/.local/bin"
    "$HOME/go/bin"
  ];
in {
  home.sessionPath = sessionPath;

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Iosevka"];})
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "ansible"
        "argocd"
        "autoenv"
        "colorize"
        "colored-man-pages"
        "cp"
        "docker"
        "git"
        "github"
        "history-substring-search"
        "jump"
        "kubectl"
        "rsync"
      ];
      theme = "gallois";
    };
  };
}
