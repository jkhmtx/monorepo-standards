{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.root.lint-gh-actions";
  runtimeInputs = [nixpkgs.actionlint nixpkgs.git];
  text = builtins.readFile ./run.sh;
}
