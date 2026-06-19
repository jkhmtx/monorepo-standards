{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.fake-server-b.test";
  runtimeInputs = [nixpkgs.nodejs nixpkgs.yarn];
  runtimeEnv = {WORKSPACE = "@ms/fake-server-b";};
  text = builtins.readFile ./run.sh;
}
