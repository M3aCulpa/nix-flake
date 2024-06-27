{pkgs-unstable, ...}: let

    sessionPath = [
        "$HOME/.local/bin"
        "$HOME/go/bin"
    ];

in {
    home.sessionPath = sessionPath;
    
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
            theme = "sorin";
        };
    };
}
