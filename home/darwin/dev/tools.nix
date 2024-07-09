{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.pnpm
    nodejs_22
    bitwarden-cli
    cmake
    gnumake
    gcc
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
