{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.modules.repository.validate";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
