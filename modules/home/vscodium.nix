{ config, lib, pkgs, ... }:

let
  cfg = config.programs.vscodium;
in
{
  options = {
    programs.vscodium = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable VSCodium";
      };

      extensions = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs.vscode-extensions; [
          dracula-theme.theme-dracula
          dart-code.dart-code
          dart-code.flutter
          pkief.material-product-icons
          ms-python.python
          rust-lang.rust-analyzer
          esbenp.prettier-vscode
          jnoortheen.nix-ide
        ];
        description = "List of extension packages to use";
      };

      userSettings = lib.mkOption {
        default = {
          "workbench.startupEditor" = "none";
          "workbench.colorTheme" = "Dracula Theme";
          "workbench.productIconTheme" = "material-product-icons";
          "window.zoomLevel" = 1;
          "editor.fontFamily" = "'fantasque sans mono', Menlo, Monaco, 'Courier New', monospace";
          "terminal.integrated.fontFamily" = "monospace";
          "editor.fontSize" = 16;
          "explorer.confirmDelete" = false;
          "editor.rulers" = [
              80
              120
          ];
          "editor.wordWrap" = "on";
          "editor.tabSize" = 2;
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
          "[dart]" =  {
            "editor.formatOnSave" = true;
            "editor.formatOnType" = true;
            "editor.selectionHighlight" = false;
            "editor.suggestSelection" = "first";
            "editor.tabCompletion" = "onlySnippets";
            "editor.wordBasedSuggestions" = "off";
          };
          "editor.cursorSmoothCaretAnimation" = "on";
        };
        description = "VSCodium user settings.json";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = cfg.extensions;
      userSettings = cfg.userSettings;
    };
  };
}
