# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # FLAKEEES
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-d16b5f87-310e-4d97-9c6d-39ec9b6cd648".device = "/dev/disk/by-uuid/d16b5f87-310e-4d97-9c6d-39ec9b6cd648";
  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "denastPC";

  # Enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # for razer mice
  hardware.openrazer.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Needed for secret saving on hyprland
  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
     # Install the packages from nixpkgs
     enable = true;
     # Whether to enable XWayland
     xwayland.enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

    # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [
    "nvidia"
    "amdgpu"
  ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime = {
    sync.enable = true;

    # Make sure to use the correct Bus ID values for your system!
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:4:0:0";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.denast = {
    isNormalUser = true;
    description = "denast";
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
    packages = with pkgs; [
      kate
    #  thunderbird
    ];
  };

  home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users = {
          "denast" = import ./home.nix;
      };
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flatupakes!!!11
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  # Gamemode (should enchance gaming :O)
  programs.gamemode.enable = true;

  # needed for qemu & virt-manager virtualizartion
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.enable = true;

  # Program for synthing files with other machines
  services = {
    syncthing = {
        enable = true;
        user = "denast";
        configDir = "/home/denast/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
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
    ripgrep     # grep opmitizer
	  gcc         # C compiler
    lshw        # ls hardware
    btop        # resource monitor
    nvtopPackages.full # GPU monitor
    waybar      # bar for hyprland
    fusuma      # touchpad gentures
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
    webcord     # conteinerized discord version
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

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hermit" "JetBrainsMono" ]; })
    font-awesome
] ;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  services.openssh = {
  enable = true;
  ports = [ 22 ];
  settings = {
    PasswordAuthentication = true;
    AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
    UseDns = true;
    X11Forwarding = false;
    PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  };
};

services.supergfxd.enable = true;
services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
