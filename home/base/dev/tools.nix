{pkgs, ...}: {
    home.packages = with pkgs; [
        nodejs_22
        python3
        qemu
        sops
        yarn
        git
        gh
        go
    ];
}