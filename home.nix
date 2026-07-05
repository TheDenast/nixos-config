{ config, pkgs, ... }:

let
  # Live-editable dotfiles inside this repo ($ is literal, not interpolation)
  dotsDir = "/home/denast/files/3_technology/30_configs/30-00_$nixos-config/dots";
in
{
  home.username = "denast";
  home.homeDirectory = "/home/denast";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "denast";
        email = "denast@proton.me";
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.distrobox = {
    enable = true;
    containers = {
      ubuntu = {
        image = "ubuntu:24.04";
        entry = true;
        additional_packages = "git curl wget build-essential software-properties-common";
      };
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.file = {
    ".config/btop".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/btop";
    ".config/dunst".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/dunst";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/fish";
    ".config/xonsh".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/xonsh";
    ".config/nushell".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/nushell";
    ".config/fusuma".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/fusuma";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/hypr";
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/kitty";
    ".config/neofetch".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/neofetch";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/nvim";
    ".config/ranger".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/ranger";
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/rofi";
    ".config/starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${dotsDir}/starship.toml";
    ".config/swappy".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/swappy";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/waybar";
    ".config/wofi".source = config.lib.file.mkOutOfStoreSymlink "${dotsDir}/wofi";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
    iconTheme = {
      package = pkgs.dracula-icon-theme;
      name = "Dracula";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4 = {
      theme = config.gtk.theme;
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Dracula";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "image/png" = [ "nsxiv.desktop" ];
      "image/jpeg" = [ "nsxiv.desktop" ];
      "image/gif" = [ "nsxiv.desktop" ];
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };
}
