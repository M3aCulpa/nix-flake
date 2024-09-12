# nix-flake

This is a Nix flake-based setup that (currently) manages macOS (via nix-darwin), Homebrew integration, and Home Manager modules. The repo uses a modular approach to configure various environments and tools efficiently across devices.

## key directories

- home/: Contains Home Manager configurations for different environments such as shells, editors, and terminal emulators.
- hosts/: Per-device configurations (e.g., MacBook Pro, desktop, etc.).
- modules/: Reusable Nix modules for applications and tools.
- settings/: System-specific settings for macOS and NixOS, including fonts, Homebrew integration, and user configurations.