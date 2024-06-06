{ pkgs, ... }: 

{

  programs.gpg = {
    enable = true;
    publicKeys = [
      { source = ../contre.pub; trust = 5; }
    ];
  };

  services.gpg-agent = {
    enable = true;
    sshKeys = [ "B38C2E9A5402A38D13E510DADD0B71744684EA35" ];
    enableSshSupport = true;
    enableZshIntegration = true;
    enableExtraSocket = true;
    defaultCacheTtl = 1300;
    grabKeyboardAndMouse = true;
    extraConfig = ''
      pinentry-program ${pkgs.pinentry-qt}/bin/pinentry-qt
      auto-expand-secmem
    '';
  };

}

