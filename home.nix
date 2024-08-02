{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "denast";
  home.homeDirectory = "/home/denast";

  programs.git = {
    enable = true;
    userName  = "denast";
    userEmail = "denast@proton.me";
  };  

  # This section symlinks dotfiles from this repo to 
  # real .config directory in $HOME
  home.file = {
    ".config/btop".source = ./dotfiles/btop;
    ".config/dunst".source = ./dotfiles/dunst;
    ".config/fish".source = ./dotfiles/fish;
    ".config/fusuma".source = ./dotfiles/fusuma;
    ".config/gtk-3.0".source = ./dotfiles/gtk-3.0;
    ".config/gtk-4.0".source = ./dotfiles/gtk-4.0;
    ".config/hypr".source = ./dotfiles/hypr;
    ".config/KDE".source = ./dotfiles/KDE;
    ".config/kdedefaults".source = ./dotfiles/kdedefaults;
    ".config/kde.org".source = ./dotfiles/kde.org;
    ".config/kitty".source = ./dotfiles/kitty;
    ".config/lazygit".source = ./dotfiles/lazygit;
    ".config/mpv".source = ./dotfiles/mpv;
    ".config/neofetch".source = ./dotfiles/neofetch;
    ".config/nvim".source = ./dotfiles/nvim;
    ".config/ranger".source = ./dotfiles/ranger;
    ".config/rofi".source = ./dotfiles/rofi;
    ".config/swappy".source = ./dotfiles/swappy;
    ".config/waybar".source = ./dotfiles/waybar;
    ".config/wofi".source = ./dotfiles/wofi;
    
    ".config/gtkrc".source = ./dotfiles/gtkrc;
    ".config/gtkrc-2.0".source = ./dotfiles/gtkrc-2.0;
    ".config/mimeapps.list".source = ./dotfiles/mimeapps.list;
    ".config/starship.toml".source = ./dotfiles/starship.toml;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
