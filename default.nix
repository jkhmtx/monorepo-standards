let
  nixpkgsSrc = import ./scripts/nixpkgs/nixpkgs-src.nix;
  nixpkgs = import nixpkgsSrc {config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) ["terraform"];};

  load = path: import path {inherit load nixpkgs nixpkgsSrc _;};

  _ = load ./index.nix;

  infallible = {
    update-nix-index = load ./scripts/update-nix-index/main.nix;
  };
in
  _.all.utils.derivations // {inherit infallible;}
