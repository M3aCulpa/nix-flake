{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
      ms-dotnettools.vscode-dotnet-runtime
      ms-dotnettools.csharp
      ms-dotnettools.csdevkit
      ms-azuretools.vscode-docker
      GitHub.copilot
      GitHub.copilot-chat
      golang.go
      hashicorp.terraform
      ms-vscode.makefile-tools
      bbenoist.Nix
      ms-python.vscode-pylance
      ms-python.python
      ms-python.debugpy
      ms-toolsai.jupyter
    ];
  };
}
