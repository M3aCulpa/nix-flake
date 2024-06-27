{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux
  ];

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "a";
    baseIndex = 1;
    escapeTime = 1;

    plugins = with pkgs; [
      tmuxPlugins.yank
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };
}
