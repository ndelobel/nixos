{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "catppuccin"
      "catppuccin-icons"
      "sql"
      "dockerfile"
    ];

    userSettings = {
      base_keymap = "JetBrains";
      theme = "Catppuccin Macchiato - No Italics";
      icon_theme = "Catppuccin Macchiato";

      buffer_font_family = "JetBrainsMono Nerd Font";
      ui_font_family = "JetBrainsMono Nerd Font";

      lsp = {
        rust-analyzer = {
          binary = {
            path_lookup = true;
          };
        };
        nixd = {
          binary = {
            path_lookup = true;
          };
        };
      };

      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
          formatter = {
            external = {
              command = "nixfmt";
              arguments = [
                "--quiet"
                "--"
              ];
            };
          };
        };
      };
    };
  };
}
