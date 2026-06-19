{
  nixpkgs,
  _,
  ...
}:
nixpkgs.writeShellApplication {
  name = "_";
  runtimeEnv = {
    INDEX = _.all.utils._.index;
  };
  runtimeInputs = [nixpkgs.fzf nixpkgs.git];
  text = builtins.readFile ./run.sh;
  meta = {
    description = "CLI entrypoint for the monorepo-standards build system";
    skipNameCheck = true;
  };
}
