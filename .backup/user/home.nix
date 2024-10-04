{config, pkgs, lib,...}:
{

  imports = [
  "./windowmanager" ];

  
  #home.enableNixpkgsReleaseCheck = false;
  home.username = "xis";
  home.homeDirectory = "/home/xis";
  home.packages = with pkgs; [
    neofetch
    librewolf
    discord
    vscodium
    neovim
    vimPlugins.nvchad
    kate
    arandr
    nitrogen
    lxappearance
    gnome.nautilus
    dnsutils
    nmap
    htop
    nvtop
    zip
    nnn
    autorandr
    obsidian
  ];
  
  programs.git = {
    enable = true;
    userName = "xsj3n";
    userEmail = "xsj3n@tutanota.com";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
      };
      import = ["/home/xis/.config/alacritty/catppuccin-mocha.toml"]; 
    
    };
  };
  
  programs.starship = {
    enable = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
