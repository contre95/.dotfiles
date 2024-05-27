{ ... }: {
  programs.gnupg = {
    agent.enable = true;
    agent.enableSSHSupport = true;
    agent.pinentryFlavor = "curses";
  };
}

