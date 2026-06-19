{nixpkgs, ...}:
nixpkgs.writeShellApplication {
  name = "_.fake-server-a.test";
  runtimeInputs = [nixpkgs.nodejs nixpkgs.yarn];
  runtimeEnv = {WORKSPACE = "@ms/fake-server-a";};
  text = builtins.readFile ./run.sh;
}
