{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.modules.book.plan";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
