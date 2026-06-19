{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.terraform.modules.book.init";
  runtimeInputs = [nixpkgs.terraform];
  text = builtins.readFile ./run.sh;
}
