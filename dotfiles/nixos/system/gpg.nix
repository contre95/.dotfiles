{ pkgs, ... }: {
  services.pcscd.enable = true;
  services.dbus.packages = [ pkgs.gcr ];
  # Enable GPG at a system level 
  services.yubikey-agent.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableExtraSocket = true;
  };

  # Enable GPG Smartcards (Like Yubikeys)
  hardware.gpgSmartcards.enable = true;
}
