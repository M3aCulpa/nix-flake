{myvars, ...}: {

    home = {
        inherit (myvars) username;
   };

  programs.home-manager.enable = true;
}