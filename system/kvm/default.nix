{config, pkgs, ...}:
let 
  user = "xis";
  platform = "amd";
  vfioids = ["10de:2520" "10de:228e"];
in
{

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
 };

 virtualisation.docker.enable = true;


 users.users.${user}.extraGroups = ["libvirtd" "qemu-libvirtd" "disk" "docker"];
 programs.virt-manager.enable = true;
 
}

