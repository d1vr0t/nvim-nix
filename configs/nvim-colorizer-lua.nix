{ pkgs, ... }:
{
  configs.nvim-colorizer-lua = {
    after = [ "gruvbox" ];
    plugins = [ pkgs.vimPlugins.nvim-colorizer-lua ];
    lua = [
      "require 'colorizer'.setup()"
    ];
  };
}
