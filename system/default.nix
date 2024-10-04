{pkgs, config, options, lib, ...}:

{
  imports =
    [
      ./hardware-configuration.nix
      ./boot
      ./audio
      ./networking
      ./display 
      ./display/windowmanager
      ./kvm
      ./services
    ];


  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "eye";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Phoenix";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  hardware.keyboard.qmk.enable = true; 
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  
  users.users.xis = {
    isNormalUser = true;
    description = "xis";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };

  fonts.packages = with pkgs; [ nerdfonts ];

  # root pkgs & config 
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
	via
	lxappearance
	systemsettings
	qt5ct
	bluez
	blueman
	nvidia-docker
	home-manager
   ];

  ## themeing
  environment.sessionVariables = {
  	QT_QPA_PLATFORMTHEME = "qt5ct"; 
  };

  qt = {
  	enable = true;
	platformTheme = "qt5ct";
  };
	
  programs.steam.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  services.udev.packages = [ pkgs.via ];
  system.stateVersion = "23.11"; # Did you read the comment?

}
