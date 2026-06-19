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
    nixpkgs.terraform
    _.all._
    _.root.check-generated-files
    _.root.format-nix
    _.root.format-sh
    _.root.lint-gh-actions
    _.root.lint-md
    _.root.lint-yaml
    _.all.check
    _.root.format-ts
    _.root.lint-ts
    _."fake-server-a".check
    _."fake-server-b".check
  ];
  text = builtins.readFile ./hook.sh;
}
