{ ... }:

{
  imports = [
    ../../modules/nixos/texteditors
    ../../modules/nixos/browsers
  ];

  programs.texteditors = {
    sublime-text.enable = true;
  };

  programs.browsers = {
    firefox.enable = true;
    chromium.enable = true;
    tor-browser.enable = true;
  };
}
