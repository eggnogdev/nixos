{ ... }:

{
  imports = [
    ../../modules/nixos/cliutils
    ../../modules/nixos/texteditors
    ../../modules/nixos/browsers
    ../../modules/nixos/office
  ];

  programs.cliutils = {
    exiftool.enable = true;
    neofetch.enable = true;
    tree.enable = true;
  };

  programs.texteditors = {
    android-studio.enable = true;
    sublime-text.enable = true;
    vim.enable = true;
  };

  programs.browsers = {
    firefox.enable = true;
    chromium.enable = true;
    tor-browser.enable = true;
  };

  programs.office = {
    anytype.enable = true;
    gnucash.enable = true;
  };
}
