{_, ...}: {
  paths = "terraform/";

  command = _.all.utils.run-many {
    name = "_.terraform.check";
    jobs = [
      {command = _.terraform.modules.repository.validate;}
      {command = _.terraform.modules.book.validate;}
    ];
  };
}
