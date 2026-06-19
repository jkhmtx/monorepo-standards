{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.all.lint-gh-actions";
  runtimeInputs = [nixpkgs.actionlint nixpkgs.git];
  text = builtins.readFile ./run.sh;
}
