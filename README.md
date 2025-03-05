# Denast NixOS Configuration
> **A configuration for NixOS that I personally daily drive**

## Features

- Flakes + Home Manager
- Multiple configurations in a single config (see below)

## Deployment Instructions

### Initial Setup

1. Clone the Repository on the New Machine:
   ```sh
   git clone https://github.com/TheDenast/nixos-config.git /home/denast/.nixos-config
   ```

2. Select configuration to build. Currently available:

   - `asus-ga401iu`
   - `framework-13`

3. Rebuild the System with the New Configuration:
   ```sh
   sudo nixos-rebuild switch --flake /home/denast/.nixos-config#{configuration}
   ```
   Where `{configuration}` is your configuration of choice

### System Updates

Since the configuration uses flakes to overwrite pinned nixpkgs version,
in order to complete the system update you have to update the flake.lock first

1. Update flake.lock 
   ```sh
   cd /home/denast/.nixos-config
   nix flake update
   ```

2. Rebuild the system with new flake.lock
   ```sh
   sudo nixos-rebuild switch --flake /home/denast/.nixos-config#{configuration}
   ```

3. If the update went well, commit and push the changes
   ```sh
   git add .
   git commit -m "Flake update"
   git push
   ```

### Configuration Updates

1. Make changes to the configuration:
   ```sh
   cd /home/denast/.nixos-config
   nvim configuration.nix  # or any other editor
   ```

2. Rebuild the system to test the changes:
   ```sh
   sudo nixos-rebuild switch --flake /home/denast/.nixos-config#{configuration}
   ```

3. If all went well, commit and push the changes:
   ```sh
   git add .
   git commit -m "specify what you changed here"
   git push
   ```
