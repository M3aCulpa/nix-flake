{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.pnpm
    nodejs_22
    sshuttle
    python3
    qemu
    sops
    yarn
    git
    gh
    go
  ];
}
