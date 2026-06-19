# Do not edit directly. This file is generated with:
#   nix --print-build-logs run --file . infallible.update-nix-index
{
  load,
  nixpkgs,
  ...
}: let
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.lib.lists) fold;

  merge = fold recursiveUpdate {};
in
  merge [
    {all._ = load ./scripts/for-nix/_/main.nix;}
    {all.check-generated-files = load ./scripts/for-nix/check-generated-files/main.nix;}
    {all.format-nix = load ./scripts/for-nix/format-nix/main.nix;}
    {all.format-sh = load ./scripts/for-nix/format-sh/main.nix;}
    {all.lint-gh-actions = load ./scripts/for-nix/lint-gh-actions/main.nix;}
    {all.lint-md = load ./scripts/for-nix/lint-md/main.nix;}
    {all.lint-yaml = load ./scripts/for-nix/lint-yaml/main.nix;}
    {all.shell = load ./scripts/for-nix/shell/main.nix;}
    {all.update-nix-index = load ./scripts/for-nix/update-nix-index/main.nix;}
    {all.utils._.index = load ./scripts/for-nix/utils/_/index/main.nix;}
    {all.utils.derivations = load ./scripts/for-nix/utils/derivations/main.nix;}
    {all.utils.derivations-flattened = load ./scripts/for-nix/utils/derivations-flattened/main.nix;}
    {all.utils.derivations-flattened-bins = load ./scripts/for-nix/utils/derivations-flattened-bins/main.nix;}
    {all.utils.run-many = load ./scripts/for-nix/utils/run-many/main.nix;}
    {book.build = load ./apps/book/scripts/for-nix/build/main.nix;}
    {book.check = load ./apps/book/scripts/for-nix/check/main.nix;}
  ]
