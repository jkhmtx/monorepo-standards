{
  nixpkgs,
  _,
  ...
}:
nixpkgs.writeShellApplication {
  name = "_.book.build";
  runtimeInputs = [_.all."mdbook-bin"];
  text = builtins.readFile ./run.sh;
}
