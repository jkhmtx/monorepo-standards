{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.all.lint-md";
  runtimeInputs = [nixpkgs.markdownlint-cli2 nixpkgs.git];
  text = builtins.readFile ./run.sh;
}
