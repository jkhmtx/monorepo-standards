{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.all.lint-ts";
  runtimeInputs = [nixpkgs.biome];
  text = builtins.readFile ./run.sh;
}
