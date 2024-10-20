{ ... }:

{
  imports = [
    ../../modules/nixos/cliutils
    ../../modules/nixos/texteditors
    ../../modules/nixos/browsers
  ];

  programs.cliutils = {
    neofetch.enable = true;
    tree.enable = true;
  };

  programs.texteditors = {
    sublime-text.enable = true;
  };

  programs.browsers = {
    firefox.enable = true;
    chromium.enable = true;
    tor-browser.enable = true;
  };
}
