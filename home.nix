{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "denast";
  home.homeDirectory = "/home/denast";

  programs.git = {
    enable = true;
    userName = "denast";
    userEmail = "denast@proton.me";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.file = {
    ".config/btop".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/btop";
    ".config/dunst".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/dunst";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/fish";
    ".config/xonsh".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/xonsh";
    ".config/nushell".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/nushell";
    ".config/fusuma".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/fusuma";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/hypr";
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/kitty";
    ".config/neofetch".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/neofetch";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/nvim";
    ".config/ranger".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/ranger";
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/rofi";
    ".config/starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/starship.toml";
    ".config/swappy".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/swappy";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/waybar";
    ".config/wofi".source = config.lib.file.mkOutOfStoreSymlink "/home/denast/.dots/wofi";
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
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
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

  # programs.kitty = {
  #   enable = true;
  #   theme = "Dracula";
  # };
}
