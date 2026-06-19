{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.modules.repository.init";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
