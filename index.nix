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
    {all._ = load ./scripts/_/main.nix;}
    {all.biome-bin = load ./scripts/biome-bin/main.nix;}
    {all.check = load ./scripts/check/main.nix;}
    {all.mdbook-bin = load ./scripts/mdbook-bin/main.nix;}
    {all.shell = load ./scripts/shell/main.nix;}
    {all.update-nix-index = load ./scripts/update-nix-index/main.nix;}
    {all.utils._.index = load ./scripts/utils/_/index/main.nix;}
    {all.utils.derivations = load ./scripts/utils/derivations/main.nix;}
    {all.utils.derivations-flattened = load ./scripts/utils/derivations-flattened/main.nix;}
    {all.utils.derivations-flattened-bins = load ./scripts/utils/derivations-flattened-bins/main.nix;}
    {all.utils.run-many = load ./scripts/utils/run-many/main.nix;}
    {book.build = load ./apps/book/scripts/build/main.nix;}
    {book.check = load ./apps/book/scripts/check/main.nix;}
    {fake-server-a.build = load ./apps/fake-server-a/scripts/build/main.nix;}
    {fake-server-a.check = load ./apps/fake-server-a/scripts/check/main.nix;}
    {fake-server-a.test = load ./apps/fake-server-a/scripts/test/main.nix;}
    {fake-server-a.type-check = load ./apps/fake-server-a/scripts/type-check/main.nix;}
    {fake-server-b.build = load ./apps/fake-server-b/scripts/build/main.nix;}
    {fake-server-b.check = load ./apps/fake-server-b/scripts/check/main.nix;}
    {fake-server-b.test = load ./apps/fake-server-b/scripts/test/main.nix;}
    {fake-server-b.type-check = load ./apps/fake-server-b/scripts/type-check/main.nix;}
    {root.check-generated-files = load ./scripts/root/check-generated-files/main.nix;}
    {root.format-nix = load ./scripts/root/format-nix/main.nix;}
    {root.format-sh = load ./scripts/root/format-sh/main.nix;}
    {root.format-ts = load ./scripts/root/format-ts/main.nix;}
    {root.lint-gh-actions = load ./scripts/root/lint-gh-actions/main.nix;}
    {root.lint-md = load ./scripts/root/lint-md/main.nix;}
    {root.lint-ts = load ./scripts/root/lint-ts/main.nix;}
    {root.lint-yaml = load ./scripts/root/lint-yaml/main.nix;}
    {terraform.modules.book.apply = load ./terraform/scripts/modules/book/apply/main.nix;}
    {terraform.modules.book.init = load ./terraform/scripts/modules/book/init/main.nix;}
    {terraform.modules.book.plan = load ./terraform/scripts/modules/book/plan/main.nix;}
    {terraform.modules.book.validate = load ./terraform/scripts/modules/book/validate/main.nix;}
    {terraform.modules.repository.apply = load ./terraform/scripts/modules/repository/apply/main.nix;}
    {terraform.modules.repository.init = load ./terraform/scripts/modules/repository/init/main.nix;}
    {terraform.modules.repository.plan = load ./terraform/scripts/modules/repository/plan/main.nix;}
    {terraform.modules.repository.validate = load ./terraform/scripts/modules/repository/validate/main.nix;}
  ]
