{ ... }:

{
  networking.wg-quick.interfaces = {
    netshield-US-CA-226 = {
      address = [ "10.2.0.2/32" ];
      dns = [ "10.2.0.1" ];

      privateKeyFile = "/etc/wireguard/netshield-US-CA-226-private.key";

      peers = [
        {
          publicKey = "WORwyyPb5VRQTmKfAoemc4rp8ROmfAFHN7hi2Mv/F3Y=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "146.70.174.82:51820";
        }
      ];
    };
  };
}
