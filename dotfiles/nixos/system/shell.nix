{ pkgs, ... }:
{
  environment.shells = with pkgs; [
    zsh
  ];
  # environment.systemPackages = with pkgs; [
  # ];
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableGlobalCompInit = true;
    # source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh
  };
}
