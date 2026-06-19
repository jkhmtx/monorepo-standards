{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.modules.repository.apply";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
