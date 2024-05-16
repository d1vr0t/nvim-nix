{ pkgs, ... }:
{
  configs.colorizer = {
    after = [ "gruvbox" ];
    plugins = [ pkgs.vimPlugins.nvim-colorizer-lua ];
    setup = { };
  };
}
