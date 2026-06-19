{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.all.format-ts";
  runtimeInputs = [nixpkgs.biome];
  text = builtins.readFile ./run.sh;
}
