{
  nixpkgs,
  _,
  ...
}:
nixpkgs.writeShellApplication {
  name = "all.shell";
  runtimeInputs = [
    nixpkgs.alejandra
    nixpkgs.actionlint
    nixpkgs.fzf
    nixpkgs.git
    nixpkgs.coreutils
    nixpkgs.shfmt
    nixpkgs.yamllint
    _.all._
    _.all.check-generated-files
    _.all.format-nix
    _.all.format-sh
    _.all.lint-gh-actions
    _.all.lint-md
    _.all.lint-yaml
  ];
  text = builtins.readFile ./hook.sh;
}
