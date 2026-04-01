{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Games & launchers
    protonup-qt # util to update Proton GE
    wineWow64Packages.stable # wine for windows apps
    winetricks # used for more advanced wine settings
    xivlauncher # ffxiv oss launcher
    wowup-cf # WoW addon manager
    moonlight-qt # remote game streaming
    prismlauncher # minecraft
    godot # game engine
    piper # software to configure logitech mice
    vintagestory # this is not minecraft btw
    openmw # OSS Morrowind Engine

    # GPU / Vulkan
    vulkan-loader
    vulkan-tools
    mesa
    libva
    libva-utils
  ];
}
