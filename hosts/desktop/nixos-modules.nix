{ ... }:

{
  imports = [
    ../../modules/nixos/texteditors
    ../../modules/nixos/browsers
  ];

  programs.sublime-text.enable = true;

  programs.browsers = {
    firefox.enable = true;
  };
}
