{_, ...}: {
  paths = ":/";

  command = _.all.utils.run-many {
    name = "_.all.check.all";
    jobs = [
      {command = _.all.format-nix;}
      {command = _.all.format-sh;}
      {command = _.all.format-ts;}
      {command = _.all.lint-yaml;}
      {command = _.all.lint-gh-actions;}
      {command = _.all.lint-md;}
      {command = _.all.lint-ts;}
      {command = _.all.check-generated-files;}
    ];
  };
}
