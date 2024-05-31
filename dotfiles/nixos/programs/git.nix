{ ... }: {
  programs.git = {
    enable = true;
    userName = "Contre";
    userEmail = "lucascontre95@gmail.com";
    extraConfig = {
      push = { autoSetupRemote = true; };
    };
  };
}

