{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # aws
    aws-iam-authenticator
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
    vagrant
    docker
  ];
}