{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.modules.book.validate";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
