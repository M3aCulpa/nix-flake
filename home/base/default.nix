{
  imports = [
    ./cloud
    ./dev
    ./editors
    ./shells
    ./utility
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    file.".zshrc".text = ''
      autoload -U compinit && compinit
    '';
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}