{pkgs, config,  ...}:
{
  
  programs.dconf.enable = true;
  environment.pathsToLink = ["/libexec"];
 

  services.xserver =
  {
    
    displayManager.gdm.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;
    windowManager.i3.enable = true;
    windowManager.i3 = 
    {
      extraPackages = with pkgs; 
      [
        rofi
	dunst
	i3lock
	i3blocks
	picom
	arandr
	dex
	xbindkeys
	xorg.xbacklight
	xorg.xdpyinfo
	sysstat
      ];
    };
  };
}
