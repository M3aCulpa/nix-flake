{pkgs, ...}: {
  users.users.johnathanbenge = {
    name = "johnathanbenge";
    home = "/Users/johnathanbenge";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Iosevka"];})
  ];

  # System Packages
  environment.systemPackages = with pkgs; [
    kind
  ];

  # Homebrew programs
  homebrew = {
    enable = true;
    global = {
      autoUpdate = true;
    };
    onActivation.cleanup = "zap";

    # casks = [
    #   "docker"
    #   "discord"
    #   "slack"
    #   "spotify"
    #   "notion"
    #   "ykman"
    #   "yubico-authenticator"
    #   "zoom"
    #   "unity-hub"
    #   "blender"
    # ];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 1;
}