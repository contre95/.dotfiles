{ pkgs, ... }: {
  # Enable GPG at a system level 
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };

  # Enable GPG Smartcards (Like Yubikeys)
  hardware.gpgSmartcards.enable = true;
}
