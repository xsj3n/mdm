{lib, config, pkgs, ...}:
{
  hardware.nvidia = 
  {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;
    prime.offload.enable = lib.mkForce false;
    prime.offload.enableOffloadCmd = lib.mkForce false;
    prime.sync.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics = 
  {
    enable = true; 
  };
  
  services.xserver = 
  {
    enable = true;
    videoDrivers = ["nvidia"];
    xkb.layout = "us";
    xkb.variant = "";
  };

}
