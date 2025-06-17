{ config, lib, pkgs, ... }:

let
  cfg = config.programs.developer.nvim;
in
{
  options = {
    programs.developer.nvim = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable NeoVim";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf = {
      enable = true;
      settings.vim = {
        theme = {
          enable = true;
          name = "base16";

          # https://github.com/ntpeters/base16-materialtheme-scheme/blob/master/material.yaml
          base16-colors = {
            base00 = "#263238";
            base01 = "#2E3C43";
            base02 = "#314549";
            base03 = "#546E7A";
            base04 = "#B2CCD6";
            base05 = "#EEFFFF";
            base06 = "#EEFFFF";
            base07 = "#FFFFFF";
            base08 = "#F07178";
            base09 = "#F78C6C";
            base0A = "#FFCB6B";
            base0B = "#C3E88D";
            base0C = "#89DDFF";
            base0D = "#82AAFF";
            base0E = "#C792EA";
            base0F = "#FF5370";
          };
        };

        lsp.enable = true;
        languages = {
          enableTreesitter = true;

          nix.enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };
      };
    };
  };
}
