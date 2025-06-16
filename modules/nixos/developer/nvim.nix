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
          name = "dracula";
          style = "dark";
        };

        lsp.enable = true;
        languages = {
          enableTreesitter = true;

          nix.enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };
}
