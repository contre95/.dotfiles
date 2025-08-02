{
  pkgs,
  inputs,
  unstable,
  hostname,
  ...
}:

let
  commonPkgs = with pkgs; [
    unstable.rockbox-utility
    fd
    feh
    imv
    mpv
    vlc
    gawk
    less
    tmux
    tree
    wget
    iotop
    gimp3
    p7zip
    rsync
    unrar
    unzip
    ffmpeg
    mpg123
    convmv
    polkit
    smassh
    swappy
    tessen
    unstable.ghostty
    clipman
    gettext
    gparted
    pcmanfm
    ntfy-sh
    kubectl
    testdisk
    cliphist
    wl-kbptr
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
    yubikey-manager
    alacritty-theme
    tmuxPlugins.tmux-thumbs
    stow
    zbar
    ripgrep
    zoxide
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
      wayland.windowManager.hyprland.systemd.enable = false;
      wayland.windowManager.hyprland = {
        plugins = [
          inputs.hyprgrass.packages.${pkgs.system}.default

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
            pkgs.picard
            pkgs.scrcpy
            pkgs.blender
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
            pkgs.picard
            pkgs.slack
            pkgs.beets
            pkgs.lingot
            pkgs.spotify
            unstable.telegram-desktop
          ]
        else if "${hostname}" == "server" then
          commonPkgs
          ++ [
            pkgs.picard
            pkgs.beets
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
