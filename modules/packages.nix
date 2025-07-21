{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Eye Candy
    neofetch # >:P
    pfetch # minimal neofetch alternative
    bfetch # utility to center and organize fetch apps
    gtk2
    gtk3
    dracula-theme # dracula gtk theme
    dracula-icon-theme # icons for gtk
    where-is-my-sddm-theme # minimalist sddm theme
    bibata-cursors # cursor theme for gtk
    cmatrix # matrix screensaver
    asciiquarium # virtual fish tank screen saver
    sl # most important linux cli tool to date

    # CLI
    kitty # terminal emulator
    fish # friendly shell
    nushell # shell w/ data piping
    xonsh # shell w/ embedded python
    starship # shell prompt
    ranger # files manager
    lshw # ls hardware
    btop # resource monitor
    powertop # laptop power monitor
    tmux # terminal window mux
    ncdu # nifty util to see disk space usage
    tree # lists dir contents as a tree
    fzf # fuzzy finder for cli
    zoxide # fancy `cd` alternative with autocompletition
    tldr # `man` alternative with simplified explanations
    eza # modern `ls` alternative
    bat # modern `cat` alternative
    yazi # modern cli file manager
    mgitstatus # quickly see status of git repos
    rclone # cli program to sync files and directories to and from cloud

    # OS-Utils
    waybar # bar for hyprland
    swww # wallpapers
    dunst # notifications
    xfce.thunar # file manager
    walker # app runner
    fusuma # touchpad gestures
    networkmanagerapplet # network applet
    wl-clipboard # copy/paste utility for wayland
    lxqt.lxqt-policykit # polkit for GUI sudo authentication
    pavucontrol # pulse audio control
    gparted # partition manager/editor
    libsForQt5.partitionmanager # gparted alternative??
    xorg.xhost # gparted doesn't start on wayland without it
    appimage-run # nixos doesn't support the format otherwise
    grim # grap wayland images
    slurp # select part of wayland workspace
    swappy # screenshot tool
    flameshot # all-in-one screenshot tool
    kdePackages.xwaylandvideobridge # allows screencapture for X.org apps
    openrazer-daemon # allows to use razer devices
    brightnessctl # used to control screen backlight
    xclip # something something xorg clipboard
    hyprshot # hyprland screenshot tool
    nwg-displays # gui tool for quick monitor setup

    # CLI-Utils
    fd # file search
    wget # downloading web files
    ripgrep # grep optimizer
    jq # json parser
    zip # zip archive support
    unzip # handy to quickly unpack zips
    sshfs # mount filesystems over ssh
    rsync # file copying util (and more!)

    # Codin'
    direnv # nixos tool for dev environments
    vim # grandpa
    neovim # THE editor
    code-cursor # AI IDE built on VS-Code
    git # versioning software
    lazygit # git TUI wrapper
    gcc # C compiler
    clang-tools # clandg toolkit
    python312 # python compiler/interpreter
    python312Packages.pip # python package manager
    gnumake # Makefile support
    valgrind # Memory management analysis tool
    rustc # Rust compiler
    cargo # Rust dependencies manager
    rust-analyzer # Rust lsp
    rustfmt # Rust formatter
    clippy # Rust linter
    basedpyright # python type checker
    ruff # python linter
    black # uncompromising python formatter
    bear # tool that generates a compilation database for clang tooling
    go # google something something language
    lua # Lua language
    lua-language-server # lsp for lua
    stylua # opinionated lua formatter
    nixfmt-rfc-style # opinionated formatter for Nix
    nixd # Nix lsp (configurable but heavy)
    nil # Nix lsp (light but basic)
    wakatime-cli # util to track codin' activity

    # Dev Stuff
    pgadmin4-desktopmode # Administration and development platform for PostgreSQL
    postman # API development
    # stm32cubemx # STM32 Microcontroller IDE
    # nrf-command-line-tools # Nordic Semiconductor nRF Command Line Tools
    # nrfutil     # Device Firmware Update tool for nRF chips
    # nrf5-sdk    # Nordic Semiconductor nRF5 Software Development Kit
    nrfconnect # Nordic Semiconductor nRF Connect for Desktop

    # Productivity
    obsidian # notes / knowledge base
    localsend # file sharing app

    # Gamin'
    protonup-qt # util to update Proton GE
    wineWowPackages.stable # wine for windows apps
    winetricks # used for more advanced wine settings
    xivlauncher # ffxiv oss launcher
    wowup-cf # WoW addon manager
    moonlight-qt # remote game streaming
    prismlauncher # minecraft

    # Social
    telegram-desktop # messaging
    vesktop # containerized discord w/ fixed screen share
    slack # messaging app I use @ work
    element-desktop # matrix client

    # Office
    libreoffice-qt6-still # office suit

    # Misc
    chromium # for when firefox doesn't render something right
    librewolf # privacy-focused firefox fork
    qemu # virtualization tool
    virt-manager # qemu gui frontend
    virtiofsd # virtual filesystems to share dirs with guest virt machines
    mpv # minimalist video player
    nsxiv # minimalist image viewer
    obs-studio # screen recording tool
    mullvad-browser # hardened firefox fork from mullvad
    gimp # image editor
    imagemagick # cli image-related stuff

    # security
    yubioath-flutter
    opensc
    gnupg
    pinentry

    # TypeScript/JavaScript development
    typescript-language-server
    nodePackages.vscode-langservers-extracted # JSON, HTML, CSS, ESLint
    nodePackages.prettier
    nodePackages.eslint

    # Docker support
    docker-compose-language-service
    nodePackages.dockerfile-language-server-nodejs

    # Node.js ecosystem
    nodejs
    nodePackages.npm
    nodePackages.typescript

  ];

  # Font definitions
  fonts.packages = with pkgs; [
    nerd-fonts.hurmit
    nerd-fonts.jetbrains-mono
    font-awesome
    monocraft
  ];
}
