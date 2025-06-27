{ ... }:

{
  imports = [
    ../../modules/nixos
  ];

  system.desktopEnvironment.xfce.enable = true;

  system.keyboard = {
    layout = "us";
    # variant = "dvorak";
  };

  # appearance.theme.orchis.enable = true;

  fonts = {
    fantasque-sans-mono.enable = true;
  };

  programs.audio = {
    # gnome-podcasts.enable = true;
    # goodvibes.enable = true;
    # kasts.enable = true;
    # musicpod.enable = true;
    strawberry.enable = true;
  };

  programs.browsers = {
    chromium.enable = true;
    firefox.enable = true;
    mullvad-browser.enable = true;
    tor-browser.enable = true;
  };

  programs.cliutils = {
    clipse.enable = true;
    exiftool.enable = true;
    neofetch.enable = true;
    tree.enable = true;
    wget.enable = true;
  };

  programs.communication = {
    cinny.enable = true;
    discord.enable = true;
    # nheko.enable = true;
    signal.enable = true;
    # simplex-chat.enable = true;
    # telegram.enable = true;
    # threema.enable = true;
  };

  programs.design = {
    freecad.enable = true;
    # krita.enable = true;
    # orca-slicer.enable = true;
    prusa-slicer.enable = true;
  };

  programs.developer = {
    android-studio.enable = true;
    docker.enable = true;
    git.enable = true;
    # mongodb-compass.enable = true;
    nvim.enable = true;
    # postman.enable = true;
    sublime-merge.enable = true;
    sublime-text.enable = true;
    vim.enable = true;
    vscodium.enable = true;
  };

  programs.education = {
    anki.enable = true;
  };

  programs.hwutils = {
    cpu-x.enable = true;
    gnomediskutil.enable = true;
    lshw.enable = true;
    mangohud.enable = true;
    openrgb.enable = true;
    pciutils.enable = true;
    phoronix.enable = true;
    solaar.enable = true;
  };

  programs.office = {
    # anytype.enable = true;
    # gnucash.enable = true;
    libreoffice.enable = true;
    protonmail.enable = true;
    # thunderbird.enable = true;
  };

  programs.photography = {
    # darktable.enable = true;
    # digikam.enable = true;
    # gimp.enable = true;
    # rawtherapee.enable = true;
  };

  programs.infosec = {
    clamav.enable = true;
    keepassxc.enable = true;
    # protonvpn.enable = true;
    veracrypt.enable = true;
    wireguard.enable = true;
  };

  programs.games = {
    # bottles.enable = true;
    # heroic.enable = true;
    lutris.enable = true;
    prismlauncher.enable = true;
    steam.enable = true;
  };

  programs.utils = {
    blueman.enable = true;
    goverlay.enable = true;
    keychain.enable = true;
    # nix-ld.enable = true;
    # ollama.enable = true;
    qbittorrent.enable = true;
    # rpi-imager.enable = true;
    syncplay.enable = true;
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
    obs-studio.enable = true;
    vlc.enable = true;
  };
}
