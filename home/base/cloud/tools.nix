{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # aws
    awscli
    eksctl

    # iac
    terragrunt
    terraform
    ansible

    # orchestration
    kubernetes-helm
    kubernetes
    kustomize
    istoctl
    fluxcd

    # virtualization
    docker
  ];
}
