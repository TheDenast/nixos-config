{ pkgs, ... }:

let
  cursorsh = pkgs.callPackage ./cursorsh.nix {};
in
{
  environment.systemPackages = with pkgs; [
    # Eye Candy
    neofetch    # >:P
    pfetch      # minimal neofetch alternative
    bfetch      # utility to center and organize fetch apps
    gtk2
    gtk3
    dracula-theme # dracula gtk theme
    dracula-icon-theme # icons for gtk
    where-is-my-sddm-theme # minimalist sddm theme
    bibata-cursors # cursor theme for gtk
    cmatrix     # matrix screensaver
    asciiquarium# virtual fish tank screen saver

    # CLI
    kitty       # terminal emulator
    fish        # shell
    starship    # shell prompt
    ranger      # files manager
    lshw        # ls hardware
    btop        # resource monitor
    powertop    # laptop power monitor
    tmux        # terminal window mux
    ncdu        # nifty util to see disk space usage
    tree        # lists dir contents as a tree
    fzf         # fuzzy finder for cli
    zoxide      # fancy `cd` alternative with autocompletition
    tldr        # `man` alternative with simplified explanations
    eza         # modern `ls` alternative
    bat         # modern `cat` alternative
    yazi        # modern cli file manager

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
    flameshot   # all-in-one screenshot tool
    xwaylandvideobridge # allows screencapture for X.org apps
    openrazer-daemon # allows to use razer devices
    brightnessctl # used to control screen backlight
    xclip       # something something xorg clipboard

    # CLI-Utils
    fd          # file search
    wget        # downloading web files
    ripgrep     # grep optimizer
    jq          # json parser
    zip         # zip archive support
    unzip       # handy to quickly unpack zips
    sshfs       # mount filesystems over ssh
    nodejs_22   # javasript stuff
    rsync       # file copying util (and more!)

    # Codin'
    vim         # grandpa
    neovim      # THE editor
    git         # versioning software
    lazygit     # git TUI wrapper
    gcc         # C compiler
    clang-tools # clandg toolkit
    python3     # Python compiler/interpreter
    gnumake     # Makefile support
    valgrind    # Memory management analysis tool
    cursorsh    # AI IDE
    rustc       # Rust compiler
    rustup      # Rust toolchain installer
    cargo       # Rust dependencies manager
    basedpyright # python type checker
    ruff        # python linter
    black       # uncompromising python formatter 
    bear        # tool that generates a compilation database for clang tooling
    go          # google something something language
    lua         # Lua language
    lua-language-server # lsp for lua

    # Dev Stuff
    pgadmin4-desktopmode # Administration and development platform for PostgreSQL
    postman     # API development
    # stm32cubemx # STM32 Microcontroller IDE
    # nrf-command-line-tools # Nordic Semiconductor nRF Command Line Tools
    # nrfutil     # Device Firmware Update tool for nRF chips
    # nrf5-sdk    # Nordic Semiconductor nRF5 Software Development Kit
    # nrfconnect  # Nordic Semiconductor nRF Connect for Desktop

    # Productivity
    obsidian    # notes / knowledge base
    localsend   # file sharing app

    # Gamin'
    protonup-qt # util to update Proton GE
    wineWowPackages.stable # wine for windows apps
    winetricks  # used for more advanced wine settings
    xivlauncher # ffxiv oss launcher
    wowup-cf    # WoW addon manager
    moonlight-qt# remote game streaming
    prismlauncher # minecraft

    # Social
    telegram-desktop # messaging
    vesktop     # containerized discord w/ fixed screen share
    slack       # messaging app I use @ work
    element-desktop # matrix client

    # Office
    libreoffice-qt6-still # office suit

    # Misc
    chromium    # for when firefox doesn't render something right
    librewolf   # privacy-focused firefox fork
    qemu        # virtualization tool
    virt-manager # qemu gui frontend
    virtiofsd   # virtual filesystems to share dirs with guest virt machines
    mpv         # minimalist video player
    nsxiv       # minimalist image viewer
    obs-studio  # screen recording tool
    mullvad-browser # hardened firefox fork from mullvad
    gimp        # image editor
    imagemagick # cli image-related stuff

    # security 
    yubikey-personalization-gui
    yubioath-flutter
    opensc
    gnupg
    pinentry
  ];


  # Font definitions
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hermit" "JetBrainsMono"]; })
    font-awesome
    monocraft
  ];
}
