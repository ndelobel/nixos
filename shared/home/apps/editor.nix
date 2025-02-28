{ pkgs, ... }: {
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
      base_keymap = "Jetbrains";
      theme = "Catppuccin Macchiato - No Italics";
      icon_theme = "Catppuccin Macchiato";

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
          formatter = {
            external = {
              command = "nixfmt";
              arguments = ["--quiet" "--"];
            };
          };
        };
      };
    };
  };
}
