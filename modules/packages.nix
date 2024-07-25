{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Eye Candy
    neofetch    # >:P
    pfetch      # minimal neofetch alternative
    bfetch      # utility to center and organize fetch apps
    dracula-theme # dracula gtk theme
    dracula-icon-theme # icons for gtk
    where-is-my-sddm-theme # minimalist sddm theme

    # CLI
    kitty       # terminal emulator
    fish        # shell
    starship    # shell prompt
    ranger      # files manager
    lshw        # ls hardware
    btop        # resource monitor
    powertop    # laptop power monitor
    nvtopPackages.full # GPU monitor
    tmux        # terminal window mux
    ncdu        # nifty util to see disk space usage
    tree        # lists dir contents as a tree

    # OS-Utils
    waybar      # bar for hyprland
    swww        # wallpapers
    dunst       # notifications
    xfce.thunar # file manager
    wofi        # app runner
    fusuma      # touchpad gestures
    networkmanagerapplet # network applet
    wl-clipboard # copy/paste utility for wayland
    lxqt.lxqt-policykit # polkit for GUI sudo authentication
    pavucontrol # pulse audio control
    gparted     # partition manager/editor
    libsForQt5.partitionmanager # gparted alternative??
    xorg.xhost  # gparted doesn't start on wayland without it
    appimage-run # nixos doesn't support the format otherwise
    grim        # grap wayland images
    slurp       # select part of wayland workspace
    swappy      # screenshot tool
    xwaylandvideobridge # allows screencapture for X.org apps
    openrazer-daemon # allows to use razer devices
    xorg.xhost

    # CLI-Utils
    fd          # file search
    wget        # downloading web files
    ripgrep     # grep optimizer
    jq          # json parser
    zip         # zip archive support
    unzip       # handy to quickly unpack zips

    # Codin'
    vim         # grandpa
    neovim      # THE editor
    git         # versioning software
    lazygit     # git TUI wrapper
    gcc         # C compiler
    clang-tools # clandg toolkit
    python3     # Python compiler/interpreter
    gnumake     # Makefile support
    #(pkgs.callPackage ./cursorsh.nix {})

    # Productivity
    obsidian    # notes / knowledge base
    localsend   # file sharing app

    # Gamin'
    protonup-qt # util to update Proton GE
    wineWowPackages.stable # wine for windows apps
    winetricks  # used for more advanced wine settings
    xivlauncher # ffxiv oss launcher
    wowup-cf    # WoW addon manager

    # Social
    telegram-desktop # messaging
    webcord     # containerized discord web version
    discord     # when webcord misbehaves

    # Office
    libreoffice-qt6-still # office suit

    # Misc
    chromium    # for when firefox doesn't render something right
    qemu        # virtualization tool
    virt-manager # qemu gui frontend
    polychromatic # razer RGB configuration

  ];

  # Font definitions
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hermit" "JetBrainsMono" ]; })
    font-awesome
  ];
}
