{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Hyprland ecosystem
    waybar # bar for hyprland
    swww # wallpapers
    dunst # notifications
    walker # app runner
    hyprshot # hyprland screenshot tool
    hyprsunset # blue light filter for hyprland
    nwg-displays # gui tool for quick monitor setup
    fusuma # touchpad gestures

    # Wayland infrastructure
    wl-clipboard # copy/paste utility for wayland
    wlr-randr
    xwayland
    libdecor
    wayland
    wayland-protocols
    wayland-utils
    grim # grap wayland images
    slurp # select part of wayland workspace
    swappy # screenshot tool
    flameshot # all-in-one screenshot tool

    # Desktop apps
    xfce.thunar # file manager
    networkmanagerapplet # network applet
    pavucontrol # pulse audio control
    brightnessctl # used to control screen backlight
    appimage-run # nixos doesn't support the format otherwise
    xorg.xhost # gparted doesn't start on wayland without it
    xclip # something something xorg clipboard
    lxqt.lxqt-policykit # polkit
    openrazer-daemon # allows to use razer devices

    # Theming
    gtk2
    gtk3
    dracula-theme # dracula gtk theme
    dracula-icon-theme # icons for gtk
    bibata-cursors # cursor theme for gtk
    where-is-my-sddm-theme # minimalist sddm theme
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hurmit
    nerd-fonts.jetbrains-mono
    font-awesome
    monocraft
  ];
}
