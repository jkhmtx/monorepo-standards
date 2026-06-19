let
  nixpkgsSrc = import ./scripts/for-nix/nixpkgs/nixpkgs-src.nix;
  nixpkgs = import nixpkgsSrc {};

  load = path: import path {inherit load nixpkgs nixpkgsSrc _;};

  _ = load ./index.nix;

  infallible = {
    update-nix-index = load ./scripts/for-nix/update-nix-index/main.nix;
  };
in
  _.all.utils.derivations // {inherit infallible;}
