{ ... }:

{
  imports = [
    ../../modules/nixos
  ];

  system.desktopEnvironment.plasma6.enable = true;

  system.keyboard = {
    layout = "us";
    # variant = "dvorak";
  };

  fonts = {
    fantasque-sans-mono.enable = true;
  };

  programs.audio = {
    strawberry.enable = true;
  };

  programs.cliutils = {
    exiftool.enable = true;
    neofetch.enable = true;
    tree.enable = true;
    wget.enable = true;
  };

  programs.communication = {
    discord.enable = true;
    signal.enable = true;
    # telegram.enable = true;
  };

  programs.browsers = {
    firefox.enable = true;
    chromium.enable = true;
    tor-browser.enable = true;
  };

  programs.design = {
    freecad.enable = true;
    gimp.enable = true;
    krita.enable = true;
    # orca-slicer.enable = true;
    prusa-slicer.enable = true;
  };

  programs.developer = {
    android-studio.enable = true;
    git.enable = true;
    # mongodb-compass.enable = true;
    # postman.enable = true;
    sublime-merge.enable = true;
    sublime-text.enable = true;
    vim.enable = true;
    vscodium.enable = true;
  };

  programs.education = {
    anki.enable = true;
  };

  programs.office = {
    # anytype.enable = true;
    # gnucash.enable = true;
    libreoffice.enable = true;
    protonmail.enable = true;
    # thunderbird.enable = true;
  };

  programs.infosec = {
    keepassxc.enable = true;
    protonvpn.enable = true;
    veracrypt.enable = true;
  };

  programs.games = {
    prismlauncher.enable = true;
    steam.enable = true;
  };

  programs.utils = {
    gnomediskutil.enable = true;
    keychain.enable = true;
    # ollama.enable = true;
    pciutils.enable = true;
    qbittorrent.enable = true;
    # rpi-imager.enable = true;
    virtualbox = {
      enable = true;
      authorizedUsers = [ "eggnog" ];
    };

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

  programs.video = {
    # obs-studio.enable = true;
    vlc.enable = true;
  };
}
