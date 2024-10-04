{lib, config, pkgs, ...}:
{
  hardware.nvidia = 
  {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;
    prime.offload = lib.mkForce false;
    prime.enableOffloadCmd = lib.mkForce false;
    prime.sync.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.opengl = 
  {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  
  services.xserver = 
  {
    enable = true;
    videoDrivers = ["nvidia"];
    layout = "us";
    xkbVariant = "";
  };

}
