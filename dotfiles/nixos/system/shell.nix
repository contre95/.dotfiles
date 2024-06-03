{ pkgs, ... }:
{
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;

  programs.zsh.enableGlobalCompInit = false;
  #programs.zsh.interactiveShellInit = ''
  #  source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh
  #'';
}
