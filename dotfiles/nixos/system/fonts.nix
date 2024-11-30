{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # Fonts
  fonts.packages = [
    unstable.nerd-fonts.jetbrains-mono
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";


}
