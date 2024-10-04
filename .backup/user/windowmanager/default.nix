{pkgs, ...}:
{
  
  services.xserver =
  {
    displayManager.gdm.enable = true;
    windowManager.i3.enable = true;
    windowManager.i3 = 
    {
      extraPackages = with pkgs; 
      [
        rofi
	dunst
	i3blocks
	i3lock
	i3status
	i3-gaps
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
