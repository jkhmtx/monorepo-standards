{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.root.lint-md";
  runtimeInputs = [nixpkgs.markdownlint-cli2 nixpkgs.git];
  text = builtins.readFile ./run.sh;
}
