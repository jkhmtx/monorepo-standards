{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.root.lint-yaml";
  runtimeInputs = [nixpkgs.yamllint nixpkgs.git];
  text = builtins.readFile ./run.sh;
}
