{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.root.format-nix";
  runtimeInputs = [nixpkgs.alejandra nixpkgs.findutils nixpkgs.git];
  text = builtins.readFile ./run.sh;
}
