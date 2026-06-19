{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.modules.book.apply";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
