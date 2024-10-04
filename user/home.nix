{config, pkgs, lib,...}:
{

 
  home.username = "xis";
  home.homeDirectory = "/home/xis";
  home.packages = with pkgs; [
    neofetch
    librewolf 
    vesktop
    lutris
    eza
    neovim
    kate
    gamemode
    vscodium
    arandr
    nitrogen
    zathura
    nautilus
    git-credential-manager
    dnsutils
    heroic
    nmap
    htop
    nvtopPackages.full
    zip
    unzip 
    nnn
    autorandr
    obsidian
    tree
    pavucontrol
    protonup-qt
    xfce.xfce4-screenshooter
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
      font.size = 12;
      font.normal = {
	family = "Terminess Nerd Font";
	style = "Regular";
	}; 
      import = ["/home/xis/.config/alacritty/dracula.toml"]; 
      window.opacity = 0.7;
     };
  };
  
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      alias homedit='sudo nvim /etc/nixos/user/home.nix'
      alias sysedit='sudo nvim /etc/nixos/system/default.nix'
      alias nx-rebuild='sudo nixos-rebuild switch --flake /etc/nixos'
      alias nx-check='nix flake check /etc/nixos'
      alias nx-update='sudo nix flake update /etc/nixos'
      alias nx-tmp='nix-shell -p'
      alias ls='eza -la'
      alias srb='sudo reboot'
      alias asus-turbo='asusctl profile -P performance'
      alias last-crash='journalctl -b -1 -e'
      nitrogen --restore > /dev/null 2>&1
    '';
  }; 
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
