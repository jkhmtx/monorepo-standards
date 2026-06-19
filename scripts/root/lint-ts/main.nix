{
  nixpkgs,
  _,
  ...
}:
nixpkgs.writeShellApplication {
  name = "_.root.lint-ts";
  runtimeInputs = [_.all."biome-bin"];
  text = builtins.readFile ./run.sh;
}
