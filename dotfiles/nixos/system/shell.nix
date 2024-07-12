{ pkgs, ... }:
{
  environment.shells = with pkgs; [
    zsh
  ];
  # environment.systemPackages = with pkgs; [
  # ];
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    shellAliases = {
      update = "sudo WHICH_MACHINE=$(hostname) nixos-rebuild switch --upgrade";
    };

    enable = true;
    enableCompletion = true;

    enableGlobalCompInit = true;
      # source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh
    interactiveShellInit = ''
      source ~/.p10k.zsh
    '';
  };
}
