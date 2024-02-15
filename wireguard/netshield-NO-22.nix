{ ... }:

{
  networking.wg-quick.interfaces = {
    netshield-NO-22 = {
      address = [ "10.2.0.2/32" ];
      dns = [ "10.2.0.1" ];

      privateKeyFile = "/etc/wireguard/netshield-NO-22-private.key";

      peers = [
        {
          publicKey = "KOITt3KQ72LHPbpVp7kp4cQo/qw2qvKPrN732UTWWFw=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "146.70.170.18:51820";
        }
      ];
    };
  };
}
