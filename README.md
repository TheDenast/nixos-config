# Denast NixOS Configuration

## Repo structure

```
.
├── flake.nix                    # Flake entry point (inputs, outputs, formatter)
├── configuration.nix            # Shared system config (locale, GC, auto-upgrade, virtualisation)
├── home.nix                     # Home Manager (dotfiles, direnv, GTK theme, mime apps)
├── dots/                        # App dotfiles, symlinked out-of-store via home.nix
│   └── nvim/                    # Separate repo (TheDenast/nvim-config), gitignored here
├── hosts/
│   └── framework-13/
│       ├── default.nix          # Host entry (hostname)
│       └── hardware.nix         # Generated hardware config + Framework-specific tweaks
└── modules/
    ├── networking.nix
    ├── programs.nix             # Hyprland, Steam, gamescope, gamemode, gnupg, nix-ld
    ├── services.nix             # Pipewire, SSH, Syncthing, fprintd, XDG portals, etc.
    ├── users.nix
    └── packages/
        ├── default.nix          # Imports all package modules
        ├── cli.nix              # Shells, terminal, CLI tools, fun
        ├── desktop.nix          # Hyprland ecosystem, Wayland, theming, fonts
        ├── development.nix      # Editors, languages, LSPs, dev tools
        ├── gaming.nix           # Games, Wine/Proton, GPU/Vulkan
        └── apps.nix             # Browsers, social, productivity, media, security
```

## Quick reference

```sh
# Rebuild and switch immediately
sudo nixos-rebuild switch --flake '/home/denast/files/3_technology/30_configs/30-00_$nixos-config#framework-13'

# Rebuild into bootloader only (activate on next reboot)
sudo nixos-rebuild boot --flake '/home/denast/files/3_technology/30_configs/30-00_$nixos-config#framework-13'

# Update flake inputs
cd '/home/denast/files/3_technology/30_configs/30-00_$nixos-config' && nix flake update

# Format all Nix files
nix fmt

# Garbage-collect old generations
nix-collect-garbage -d

# Rollback to previous generation
sudo nixos-rebuild switch --rollback

# List system generations
nix profile history --profile /nix/var/nix/profiles/system
```

## Auto-upgrade

`system.autoUpgrade` is configured to run `nixos-rebuild boot` daily at 04:00 with idle CPU/IO scheduling. New generations are registered in the bootloader but never activate until you reboot. The Nix daemon yields all resources to foreground tasks, so builds won't affect gaming or other workloads.

Manual `nix flake update` + rebuild is still needed if you want to update inputs on your own schedule.

## Initial setup

```sh
git clone https://github.com/TheDenast/nixos-config.git '/home/denast/files/3_technology/30_configs/30-00_$nixos-config'
git clone https://github.com/TheDenast/nvim-config.git '/home/denast/files/3_technology/30_configs/30-00_$nixos-config/dots/nvim'
sudo nixos-rebuild switch --flake '/home/denast/files/3_technology/30_configs/30-00_$nixos-config#framework-13'
```
