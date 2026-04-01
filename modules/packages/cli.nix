{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Shells & prompt
    fish # friendly shell
    nushell # shell w/ data piping
    xonsh # shell w/ embedded python
    starship # shell prompt

    # Terminal
    kitty # terminal emulator

    # CLI tools
    bat # modern `cat` alternative
    eza # modern `ls` alternative
    fzf # fuzzy finder for cli
    zoxide # fancy `cd` alternative with autocompletition
    yazi # modern cli file manager
    ranger # files manager
    tmux # terminal window mux
    btop # resource monitor
    powertop # laptop power monitor
    ncdu # nifty util to see disk space usage
    tree # lists dir contents as a tree
    tldr # `man` alternative with simplified explanations
    fd # file search
    wget # downloading web files
    ripgrep # grep optimizer
    jq # json parser
    zip # zip archive support
    unzip # handy to quickly unpack zips
    sshfs # mount filesystems over ssh
    rsync # file copying util (and more!)
    rclone # cli program to sync files and directories to and from cloud
    mgitstatus # quickly see status of git repos
    ansible # remote server orchestration software
    lshw # ls hardware

    # Fun
    fastfetch # >:P
    pfetch # minimal neofetch alternative
    bfetch # utility to center and organize fetch apps
    cmatrix # matrix screensaver
    asciiquarium # virtual fish tank screen saver
    sl # most important linux cli tool to date
  ];
}
