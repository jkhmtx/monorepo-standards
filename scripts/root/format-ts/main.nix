{
  nixpkgs,
  _,
  ...
}:
nixpkgs.writeShellApplication {
  name = "_.root.format-ts";
  runtimeInputs = [_.all."biome-bin"];
  text = builtins.readFile ./run.sh;
}
