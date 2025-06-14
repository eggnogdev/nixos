{ ... }:

{
  imports = [
    ../../modules/nixos
  ];

  system.keyboard = {
    layout = "us";
    # variant = "dvorak";
  };

  programs.cliutils = {
    exiftool.enable = true;
    neofetch.enable = true;
    tree.enable = true;
    wget.enable = true;
  };

  programs.developer = {
    git.enable = true;
    vim.enable = true;
  };

  programs.infosec = {
    clamav.enable = true;
    wireguard.enable = true;
  };

  programs.selfhosted = {
    invidious.enable = true;
  };

  programs.shells = {
    bash = {
      aliases = {
        ll = "ls -l";
        lla = "ls -la";
      };
    };
  };
}
