# NixOS Flake Config

NixOS system and home manager user configuration managed through flakes.

## General

- [x] Add host and user configuration module
- [x] Install NixOS on desktop and test new configuration
- [x] Replace desktop host files with proper ones
- [x] Configure Nixvim
- [x] Find and configure replacement shell for bash
- [x] Create Pipewire module for NixOS

## Nixvim

- [x] CMP autocomplete
- [ ] Snippet
- [ ] Tree menu
- [ ] Toggle terminal
- [ ] Remove color from side bar
  - Remove bg from LSP signs
- [ ] Telescope
- [x] Nix LSP
- [x] Latex LSP
- [x] C++ LSP
- [x] Highlight current scope with treesitter and indent blankline

### Nixvim Bugs

- [ ] Fix icons for fidget nvim and lua tree

## Shell

- [x] Launch fish in nix shell
- [x] Have space ship enabled in bash shell by default

## Hyprland

Move following configs to Home Manager directory:

- [ ] Waybar
- [ ] Mako
- [ ] Wofi

After configs have been moved:

- [x] Move Hyprland setup to Nix config
- [ ] Move Waybar setup to Nix config
- [ ] Move Mako setup to Nix config
- [ ] Move Wofi setup to Nix config

Add following features to Hyprland:

- [x] Install and setup screenshot manager
- [ ] Hyprbar setup
  - [ ] Make em work
  - [ ] Window rule to show hyprbar on floating windows
- [ ] Hyprlock
- [ ] Power menu

### Waybar

- [ ] Pipewire controls
- [ ] Hyprland/workspace on each monitor
- [ ] App menu

## Pipewire

- [x] Fix Discord notification issue
- [ ] Fix Vesktop having no sound
- [ ] Add mic system wide noise cancellation
