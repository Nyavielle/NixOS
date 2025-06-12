{ setupName, ... }:
{
  networking.hostName = setupName;
  networking.wireless.iwd.enable = true;
}
