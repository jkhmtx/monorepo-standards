{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.book.build";
  runtimeInputs = [nixpkgs.mdbook];
  text = builtins.readFile ./run.sh;
}
