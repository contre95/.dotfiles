{ pkgs, config, ... }: 

{
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
    publicKeys = [
      { source = ../contre.pub; trust = 5; }
    ];
  };

  services.gpg-agent = {
    enable = true;
    sshKeys = [ "B38C2E9A5402A38D13E510DADD0B71744684EA35" ]; # [A] Subkey with auth capabilities.
    enableSshSupport = true;
    enableZshIntegration = true;
    enableExtraSocket = true;
    defaultCacheTtl = 1300;
    grabKeyboardAndMouse = false;
    extraConfig = ''
      pinentry-program ${pkgs.pinentry-gnome3}/bin/pinentry-gnome3
      auto-expand-secmem
    '';
  };

}

