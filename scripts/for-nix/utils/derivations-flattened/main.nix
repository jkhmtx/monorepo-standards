{
  nixpkgs,
  _,
  ...
}: let
  inherit (builtins) concatStringsSep;
  inherit (nixpkgs.lib.attrsets) foldlAttrs isAttrs isDerivation optionalAttrs;

  collectDerivations = path: value:
    if isDerivation value
    then {${concatStringsSep "." path} = value;}
    else optionalAttrs (isAttrs value) (flattenDerivations path value);

  flattenDerivations = path:
    foldlAttrs
    (acc: name: value: acc // (collectDerivations (path ++ [name]) value))
    {};
in
  flattenDerivations [] _.all.utils.derivations
