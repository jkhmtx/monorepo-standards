{
  nixpkgs,
  _,
  ...
}: let
  inherit (nixpkgs.lib.attrsets) filterAttrs;
in
  filterAttrs (name: drv: !(drv.meta.private or false))
  _.all.utils.derivations-flattened
