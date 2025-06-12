{
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ 22 ];
    allowedUDPPorts = [];

    allowedICMPTypes = [];

    logAllowed = false;
    logDropped = true;

    checkReversePath = true;
  };
}
