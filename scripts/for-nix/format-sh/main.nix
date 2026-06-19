{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.all.format-sh";
  runtimeInputs = [nixpkgs.shfmt nixpkgs.findutils nixpkgs.git];
  text = builtins.readFile ./run.sh;
}
