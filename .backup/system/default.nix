{ config, options, lib, ...}:
let 
  pkgs = import <nixpkgs>;
in  
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../boot
      ../audio
      ../graphics
     # ../windowmanager # remember to import home-manager modules under ./user/default.nix
    ];



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
  
  
  users.users.xis = {
    isNormalUser = true;
    description = "xis";
    extraGroups = [ "networkmanager" "wheel" ];

  };

  fonts.packages = with pkgs; [
    udev-gothic-nf
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    via
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  services.udev.packages = [ pkgs.via ];
  system.stateVersion = "23.11"; # Did you read the comment?

}
