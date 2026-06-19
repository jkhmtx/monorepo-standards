{
  nixpkgs,
  load,
  ...
}: let
  updateNixIndex = load ./../update-nix-index/main.nix;
in
  nixpkgs.writeShellApplication {
    name = "_.all.check-generated-files";
    runtimeInputs = [updateNixIndex nixpkgs.git nixpkgs.diffutils];
    text = builtins.readFile ./run.sh;
  }
