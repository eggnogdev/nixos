{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  imports = [
    # ./netshield-NO-22.nix
    # ./netshield-NO-33.nix
    # ./netshield-US-CA-226.nix
  ];
}
