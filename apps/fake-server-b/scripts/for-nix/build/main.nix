{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.fake-server-b.build";
  runtimeInputs = [nixpkgs.nodejs nixpkgs.yarn];
  runtimeEnv = {WORKSPACE = "@ms/fake-server-b";};
  text = builtins.readFile ./run.sh;
}
