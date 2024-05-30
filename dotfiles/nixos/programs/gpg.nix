{ home-manager, config, pkgs, ... }: {

  programs.gpg = {
    enable = true;
    publicKeys = [
      { source = ../contre.pub; trust = 5; }
    ];
  };

  services.gpg-agent = {
    sshKeys = [ "B38C2E9A5402A38D13E510DADD0B71744684EA35" ];
    enableSshSupport = true;
    defaultCacheTtl = 1300;
    enableExtraSocket = true;
    pinentryFlavor = null;
    extraConfig = ''
      pinentry-program ${pkgs.pinentry-rofi}/bin/pinentry-rofi
      auto-expand-secmem
    '';
  };

}

