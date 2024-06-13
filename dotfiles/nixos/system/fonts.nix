{ ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # Fonts
  fonts.packages = [
    (unstable.nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" "FiraCode" ]; })
  ];

}
