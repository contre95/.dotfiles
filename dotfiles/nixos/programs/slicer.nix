{ lib, pkgs, ... }:
let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
in
{
  config =
    if
      lib.elem whichMachine [
        "desktop"
      ]
    then
      {
        home.packages = [
          (pkgs.makeDesktopItem {
            name = "orca-slicer";
            exec = "${(pkgs.writeScriptBin "orca-slicer-wrapper" ''
              #!/bin/sh
              export __GLX_VENDOR_LIBRARY_NAME=mesa
              export __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json
              exec ${pkgs.orca-slicer}/bin/orca-slicer "$@"
            '')}/bin/orca-slicer-wrapper";
            icon = "print"; # Replace with the actual icon name or path if available
            comment = "3D Printing Slicer";
            desktopName = "Orca Slicer";
            terminal = false;
          })
          # orca-slicer
        ];
      }
    else
      { };
}
