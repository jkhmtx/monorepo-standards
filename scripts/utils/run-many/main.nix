{
  nixpkgs,
  _,
  ...
}: {
  jobs,
  name,
  parallel ? "auto",
  prefixOutput ? true,
  runtimeEnv ? {},
}: let
  inherit (nixpkgs.lib.strings) concatStringsSep optionalString;

  shouldPrefix = job: prefixOutput && !(job.command.meta.prefixedOutput or false);

  jobCommands = map (job: job.command) jobs;
  jobNames = map (job: job.command.name) jobs;

  toMakeFile = job: ''
    ${job.command.name}: ${toString (job.needs or [])}
      @ ${saveExitCode.name} ${job.command.name} ${optionalString (shouldPrefix job) prefix.name} ${job.command.name};
  '';

  makefile = nixpkgs.writeTextFile {
    name = "${name}-makefile";
    text = ''
      NAMES = ${toString jobNames}
      SHELL = ${nixpkgs.bash}/bin/bash

      .PHONY: $(NAMES)
      .RECIPEPREFIX := $() $()
      all: $(NAMES)
      ${concatStringsSep "\n" (map toMakeFile jobs)}
    '';
  };

  prefix = nixpkgs.writeShellApplication {
    name = "prefix";
    text = builtins.readFile ./prefix.sh;
  };

  saveExitCode = nixpkgs.writeShellApplication {
    name = "save-exit-code";
    text = builtins.readFile ./save-exit-code.sh;
  };
in (nixpkgs.writeShellApplication {
  inherit name;
  runtimeEnv =
    runtimeEnv
    // {
      MAKEFILE = makefile;
      PARALLEL = parallel;
    };
  runtimeInputs =
    jobCommands
    ++ [
      nixpkgs.gnumake
      prefix
      saveExitCode
    ];
  text = builtins.readFile ./run.sh;

  meta.prefixedOutput = prefixOutput;
})
