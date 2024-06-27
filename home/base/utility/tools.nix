{pkgs, ...}: {
    home.packages = with pkgs; [
        flameshot 
        openssh
        ripgrep
        gnutar
        gnupg
        wget
        tree
        jq
        yq
    ];
}