{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neofetch    # >:P
    fd          # file search
    vim         # grandpa
    wget        # downloading web files
    neovim      # THE editor
    ranger      # files manager
    kitty       # terminal emulator
    fish        # shell
    starship    # shell prompt
    git         # versioning software
    lazygit     # git TUI wrapper
    ripgrep     # grep optimizer
    gcc         # C compiler
    lshw        # ls hardware
    btop        # resource monitor
    nvtopPackages.full # GPU monitor
    waybar      # bar for hyprland
    fusuma      # touchpad gestures
    swww        # wallpapers
    dunst       # notifications
    xfce.thunar # file manager
    wofi        # app runner
    networkmanagerapplet # network applet
    tmux        # terminal window mux
    wl-clipboard # copy/paste utility for wayland
    protonup-qt # util to update Proton GE
    ncdu        # nifty util to see disk space usage
    wineWowPackages.stable # wine for windows apps
    winetricks  # used for more advanced wine settings
    gnome3.adwaita-icon-theme # for gtk icons
    lxqt.lxqt-policykit # polkit for GUI sudo authentication
    telegram-desktop # messaging
    webcord     # containerized discord version
    jq          # json parser
    xivlauncher # ffxiv oss launcher
    pavucontrol # pulse audio control
    powertop    # laptop power monitor
    gparted     # partition manager/editor
    xorg.xhost  # gparted doesn't start on wayland without it
    appimage-run # nixos doesn't support the format otherwise
    localsend   # file sharing app
    python3     # programming lang
    libsForQt5.partitionmanager # gparted alternative??
    grim        # grap wayland images
    slurp       # select part of wayland workspace
    swappy      # screenshot tool
    discord
    xwaylandvideobridge
    chromium
    zip
    unzip
    libreoffice-qt6-still
    openrazer-daemon
    polychromatic
    qemu
    virt-manager
    wowup-cf
    obsidian
  ];
}
