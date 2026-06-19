{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.modules.repository.plan";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
