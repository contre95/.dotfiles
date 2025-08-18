{
  lib,
  unstable,
  hostname,
  pkgs,
  ...
}:
{
  config =
    if
      lib.elem hostname [
        "desktop"
        "tablet"
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
              exec ${unstable.orca-slicer}/bin/orca-slicer "$@"
            '')}/bin/orca-slicer-wrapper";
            icon = "print"; # Replace with the actual icon name or path if available
            comment = "3D Printing Slicer";
            desktopName = "Orca Slicer";
            terminal = false;
          })
          # (pkgs.makeDesktopItem {
          #   name = "bambu-studio";
          #   exec = "${(pkgs.writeScriptBin "bambu-studio-wrapper" ''
          #     #!/bin/sh
          #     export __GLX_VENDOR_LIBRARY_NAME=mesa
          #     export __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json
          #     exec ${pkgs.bambu-studio}/bin/bambu-studio "$@"
          #   '')}/bin/bambu-studio-wrapper";
          #   icon = "print"; # Replace with the actual icon name or path if available
          #   comment = "3D Printing Slicer";
          #   desktopName = "Bambu Studio";
          #   terminal = false;
          # })
        ];
      }
    else
      { };
}
