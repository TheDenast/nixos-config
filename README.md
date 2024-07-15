# Denast NixOS Configuration
> **A configuration for NixOS that I personally daily drive**

## Deployment Instructions

### Step-by-Step Guide

1. **Clone the Repository on the New Machine:**
   ```sh
   git clone https://github.com/TheDenast/nixos-config.git /home/denast/.nixos-config
   ```

2. **Create a Symlink to `/etc/nixos`:**
   ```sh
   sudo ln -s /home/denast/.nixos-config /etc/nixos
   ```

3. **Rebuild the System with the New Configuration:**
   ```sh
   sudo nixos-rebuild switch --flake /home/denast/.nixos-config#default
   ```

### Regular Updates

1. **Make Changes to the Configuration:**
   ```sh
   cd /home/denast/.nixos-config
   nano configuration.nix  # or any other editor
   ```

2. **Commit and Push the Changes:**
   ```sh
   git add .
   git commit -m "Updated configuration"
   git push
   ```

3. **Rebuild the System to Apply the Changes:**
   ```sh
   sudo nixos-rebuild switch --flake /home/denast/.nixos-config#default
   ```
