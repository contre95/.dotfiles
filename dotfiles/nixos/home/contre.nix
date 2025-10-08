{
  pkgs,
  inputs,
  unstable,
  hostname,
  ...
}:

let
  commonPkgs = with pkgs; [
    fd
    feh
    imv
    moc
    mpv
    vlc
    gawk
    less
    stow
    tmux
    tree
    wget
    flac
    zbar
    gimp3
    iotop
    p7zip
    rsync
    unrar
    unzip
    convmv
    ffmpeg
    mpg123
    polkit
    smassh
    swappy
    tessen
    zoxide
    picard
    clipman
    gettext
    gparted
    kubectl
    ntfy-sh
    pcmanfm
    ripgrep
    cliphist
    testdisk
    wl-kbptr
    exiftool
    alacritty
    bandwhich
    coreutils
    util-linux
    xorg.xhost
    easyeffects
    tree-sitter
    wf-recorder
    wl-clipboard
    android-tools
    alacritty-theme
    yubikey-manager
    unstable.ghostty
    tmuxPlugins.tmux-thumbs
    unstable.rockbox-utility
  ];
in
{

  users.users.contre.isNormalUser = true;
  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = { inherit hostname unstable; };
  programs.nano.enable = false;
  imports = [
    ../system/gnupg.nix
    ../system/openssh.nix
    ../system/touch.nix
    ../system/wg-vpn.nix
    ../system/syncthings.nix
    ../programs/steam.nix
    ../programs/ai.nix
  ];

  home-manager.users.contre =
    {
      pkgs,
      config,
      unstable,
      ...
    }:
    {
      wayland.windowManager.hyprland.systemd.enable = true;
      wayland.windowManager.hyprland = {
        plugins = [
          inputs.hyprgrass.packages.${pkgs.system}.default
          inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
          # optional integration with pulse-audio, see examples/hyprgrass-pulse/README.md
          inputs.hyprgrass.packages.${pkgs.system}.hyprgrass-pulse
        ];
      };
      programs.home-manager.enable = true;
      home.username = "contre";
      home.homeDirectory = "/home/contre";
      home.sessionVariables = {
        MY_FOLDER = "/home/canus";
        SCR_PATH = "$MY_FOLDER/scripts";
        PATH = "$PATH:$MY_FOLDER/scripts/bin-scr:/Users/lucas.contreras/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$HOME/.pyenv/bin:/go/bin/:$HOME/.cargo/bin";
        EDITOR = "nvim";
      };

      home.packages =
        if "${hostname}" == "desktop" then
          commonPkgs
          ++ [
            pkgs.lingot
            pkgs.scrcpy
            pkgs.blender
            pkgs.koreader
            unstable.telegram-desktop
          ]
        else if "${hostname}" == "notebook" then
          commonPkgs
          ++ [
            pkgs.slack
            pkgs.lingot
            pkgs.scrcpy
            pkgs.blender
            pkgs.spotify
            pkgs.telegram-desktop
          ]
        else if "${hostname}" == "tablet" then
          commonPkgs
          ++ [
            pkgs.krita
            pkgs.slack
            pkgs.lingot
            pkgs.spotify
            pkgs.koreader
            pkgs.telegram-desktop
          ]
        else if "${hostname}" == "server" then
          commonPkgs
          ++ [
            unstable.beets
          ]
        else
          commonPkgs ++ [ ];

      imports = [
        ../programs/git.nix
        ../programs/gpg.nix
        ../programs/gtk.nix
        ../programs/obs.nix
        ../programs/ssh.nix
        ../programs/zsh.nix
        ../programs/pass.nix
        ../programs/test.nix
        ../programs/discord.nix
        ../programs/slicer.nix
        ../programs/librewolf.nix
        ../programs/devtools.nix
      ];

      # home.extraOutputsToInstall = [ "share/tmux-plugins" ];

      home.file = import ./dotfiles.nix { inherit config pkgs; };

      home.stateVersion = "25.05";
    };
}
