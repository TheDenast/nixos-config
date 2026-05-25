{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Browsers
    chromium # for when firefox doesn't render something right
    librewolf # privacy-focused firefox fork
    mullvad-browser # hardened firefox fork from mullvad

    # Social
    telegram-desktop # messaging
    discord # self explanotary
    slack # messaging app I use @ work
    element-desktop # matrix client

    # Productivity
    obsidian # notes / knowledge base
    localsend # file sharing app
    libreoffice-qt6-still # office suit
    anki # word repetition software

    # Media
    mpv # minimalist video player
    nsxiv # minimalist image viewer
    obs-studio # screen recording tool
    gimp # image editor
    imagemagick # cli image-related stuff

    # Virtualization
    qemu # virtualization tool
    virt-manager # qemu gui frontend
    virtiofsd # virtual filesystems to share dirs with guest virt machines

    # Security
    yubioath-flutter
    opensc
    gnupg

    # Misc
    anydesk
    fw-ectool # framework embedded controller tool (mainly for manual fan control)
    python313Packages.passlib # need it for matrix ansible
    just # need it for matrix ansible
  ];
}
