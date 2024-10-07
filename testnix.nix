{ config, pkgs, lib, ...}:
{
  networking.firewall.allowedUDPPorts = [51820 53];
  networking.firewall.allowedTCPPorts = [ 51877 53];

  services.dnsmasq = {
    enable = true;
    extraConfig = ''
      interface=wg0
    '';
  };

  networking.nat = {
    enable = true;
    enableIPv6  = false;
    externalInterface = "enu1u1";
    internalInterfaces = [ "wg0" ];
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.140.0.1/24" ];
      listenPort = 51820;
      privateKeyFile = "/home/wire/.wire/private.key";

      postUp = ''
        ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.140.0.1/24 -o enu1u1 -j MASQUERADE
      '';

      preDown = ''
        ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.140.0.1/24 -o enu1u1 -j MASQUERADE
      '';

      peers = [
        {
          publicKey = "8Sy+5w8MQILqS9Ec84EJDm3AXGmvHC9k2HmnykEj5xk=";
          allowedIPs = [ "10.140.0.2/32" ];
        }
	{
	  publicKey = "iyMCJ4edL5E7r+FW9r1cXaxZH6Bl4rEjzyz3HV9KCU0=";
	  allowedIPs = [ "10.140.0.3/32" ];
	}
	{
	  publicKey = "0FukUOCFlJGXFYPUkuGPhtp641tYfV79zYyx3wP4LTQ=";
	  allowedIPs = [ "10.140.0.4/32" ];
	}
      ];
    };
  };
}
