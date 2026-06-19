{_, ...}: {
  paths = ":/";

  command = _.all.utils.run-many {
    name = "_.root.check";
    jobs = [
      {command = _.root.format-nix;}
      {command = _.root.format-sh;}
      {command = _.root.format-ts;}
      {command = _.root.lint-yaml;}
      {command = _.root.lint-gh-actions;}
      {command = _.root.lint-md;}
      {command = _.root.lint-ts;}
      {command = _.root.check-generated-files;}
    ];
  };
}
