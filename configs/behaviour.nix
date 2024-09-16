{
  pkgs,
  lib,
  ...
}:
{
  configs.treesitter-context.setup.args = {
  max_lines = lib.mkForce 4;
  separator = "═";
  line_numbers = true;
};
}
