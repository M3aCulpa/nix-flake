{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
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
      theme = "sorin";
    };
  };
}
