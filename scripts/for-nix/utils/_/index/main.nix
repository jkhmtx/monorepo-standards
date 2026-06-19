{
  nixpkgs,
  _,
  ...
}: let
  inherit (builtins) concatStringsSep attrNames;

  derivations = _.all.utils.derivations-flattened-bins;
  header = "derivation";
  lines = [header] ++ (attrNames derivations);
in
  nixpkgs.runCommand "_.all.utils._.index" {
    INDEX = concatStringsSep "\n" lines;
    passAsFile = ["INDEX"];
  }
  ''
    mkdir -p "$out"
    cp "$INDEXPath" "$out/index.txt"
  ''
