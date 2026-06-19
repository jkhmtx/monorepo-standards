{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "infallible.update-nix-index";
  runtimeInputs = [nixpkgs.git nixpkgs.coreutils];
  text = builtins.readFile ./run.sh;
}
