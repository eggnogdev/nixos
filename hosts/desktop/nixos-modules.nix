{ ... }:

{
  imports = [
    ../../modules/nixos
  ];

  system.desktopEnvironment.plasma5.enable = true;

  system.keyboard = {
    layout = "us";
    variant = "dvorak";
  };

  programs.cliutils = {
    exiftool.enable = true;
    neofetch.enable = true;
    tree.enable = true;
    wget.enable = true;
  };

  programs.texteditors = {
    android-studio.enable = true;
    sublime-text.enable = true;
    vim.enable = true;
    vscodium.enable = true;
  };

  programs.devutils = {
    mongodb-compass.enable = true;
    postman.enable = true;
  };

  programs.browsers = {
    firefox.enable = true;
    chromium.enable = true;
    tor-browser.enable = true;
  };

  programs.office = {
    anytype.enable = true;
    gnucash.enable = true;
    libreoffice.enable = true;
    protonmail.enable = true;
  };

  programs.infosec = {
    keepassxc.enable = true;
    protonvpn.enable = true;
    veracrypt.enable = true;
  };

  programs.communication = {
    signal.enable = true;
    telegram.enable = true;
  };

  programs.git = {
    git.enable = true;
    sublime-merge.enable = true;
  };

  programs.games = {
    prismlauncher.enable = true;
    steam.enable = true;
  };

  programs.utils = {
    gnomediskutil.enable = true;
    keychain.enable = true;
    pciutils.enable = true;
    qbittorrent.enable = true;
    rpi-imager.enable = true;
    virtualbox = {
      enable = true;
      authorizedUsers = [ "testnixos" ];
    };
    vlc.enable = true;
    xclicker.enable = true;
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
