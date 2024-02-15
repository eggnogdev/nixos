{ ... }:

{
  networking.wg-quick.interfaces = {
    netshield-NO-33 = {
      address = [ "10.2.0.2/32" ];
      dns = [ "10.2.0.1" ];

      privateKeyFile = "/etc/wireguard/netshield-NO-33-private.key";

      peers = [
        {
          publicKey = "sSbgwNAoZtBVWlg6ZLnFDrXTM3YFTpPVKgE4DtzSUw0=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "146.70.170.2:51820";
        }
      ];
    };
  };
}
