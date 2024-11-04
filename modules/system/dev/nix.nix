{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixd # lsp
    nixfmt-rfc-style # formatter
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
