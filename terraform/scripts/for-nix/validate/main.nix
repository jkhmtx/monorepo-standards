{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.validate";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
