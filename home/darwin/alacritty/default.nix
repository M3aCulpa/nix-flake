{...}: {
  imports = [
    ../../../modules/home/alacritty
  ];

  programs.alacritty = {
    enable = true;
  };
}