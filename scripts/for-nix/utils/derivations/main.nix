{
  nixpkgs,
  _,
  ...
}: let
  inherit (builtins) mapAttrs removeAttrs;
  inherit (nixpkgs.lib.attrsets) isDerivation;
  inherit (nixpkgs.lib.trivial) flip pipe;

  removeUtils = flip removeAttrs ["utils"];

  removeNestedUtils = mapAttrs (name: value:
    if isDerivation value
    then value
    else pipe value [removeNestedUtils removeUtils]);
in
  removeNestedUtils _
