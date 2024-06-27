{congif, pkgs, ...}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      exrtaPackages = with pkgs; [
        alejandra # nix formatter
        clang-tools
        delve
        fzf
        gopls
        gofumpt
        goimports-reviser
        lua-language-server
        lldb
        nixd # nix lauguage server
      ];
    };
  };
}