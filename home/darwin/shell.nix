let
  envExtra = ''
    export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"
  '';
in {
  programs.zsh = {
    enable = true;
    inherit envExtra;
  };
}
