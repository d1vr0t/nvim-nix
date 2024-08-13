{ pkgs, ... }:
{
  configs.ale = {
    plugins = [ pkgs.vimPlugins.ale ];
     lua = [
      "vim.g.ale_linter_aliases = { vue = {'javascript'} }"
      "vim.g.ale_linters = { 
         javascript = {'eslint'},
         typescript = {'eslint'},
         vue = {'eslint'}
      }"
      "vim.g.ale_fixers = { 
         javascript = {'eslint'},
         typescript = {'eslint'},
         vue = {'eslint'}
      }"
      "vim.g.ale_fix_on_save = 1"
    ];
  };
}
