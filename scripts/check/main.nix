{
  nixpkgs,
  _,
  ...
}: let
  inherit (builtins) attrNames readDir readFile;

  ifModified = paths: command:
    nixpkgs.writeShellApplication {
      name = command.name;
      runtimeEnv = {
        PATHS = paths;
        COMMAND = command.name;
      };
      runtimeInputs = [command nixpkgs.git];
      text = readFile ./if-modified.sh;
    };

  createSection = path: let
    section = import path {inherit ifModified _;};
  in {
    command = ifModified section.paths section.command;
  };

  sectionFiles =
    map
    (name: ./sections + "/${name}")
    (attrNames (readDir ./sections));
in
  _.all.utils.run-many {
    name = "_.all.check";
    jobs = map createSection sectionFiles;
    prefixOutput = false;
  }
