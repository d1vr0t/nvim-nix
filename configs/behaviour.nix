{
  lib,
  config,
  pkgs,
  builtins,
  ...
}:
{
  configs.treesitter-context.setup.args.enable = false;
  configs.lspconfig.lspconfig.servers.nixd.config = {
    cmd = [ "${pkgs.nixd}/bin/nixd" ];
    settings.nixd = {

         nixpkgs = {
            expr = "import <nixpkgs> { }";
         };
    };
  };
}
