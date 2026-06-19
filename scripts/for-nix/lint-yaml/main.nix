{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.all.lint-yaml";
  runtimeInputs = [nixpkgs.yamllint nixpkgs.git];
  text = builtins.readFile ./run.sh;
}
