{ lib, ... }:
{
  configs.cmp.setup.args = lib.mkForce ./cmp_setup_args.lua;
}
