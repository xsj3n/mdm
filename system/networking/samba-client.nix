{ config, lib, pkgs, ...}:
let automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s"; in 
{
  # For mount.cifs, required unless domain name resolution is not needed.
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/home/xis/netstore/LSTR" = {
    device = "//192.168.0.104/LSTR";
    fsType = "cifs";
    options = [ "${automount_opts}" "username=xs" "password=M2!-cmjDmkdj-!ZA" "uid=1000,gid=100" ];
  };

    # For mount.cifs, required unless domain name resolution is not needed.
  fileSystems."/home/xis/netstore/FALKE" = {
    device = "//192.168.0.104/FALKE";
    fsType = "cifs";
    options = ["${automount_opts}"];
  };
}
