{ ... }: {
  programs.ssh = {
    matchBlocks = map
      (ip: {
        net = {
          host = ip;
          forwardAgent = true;
        };
      }) [ "192.168.0.174" "192.168.0.170" "192.168.0.179" ];
  };
}
