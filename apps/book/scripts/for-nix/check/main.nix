{_, ...}:
_.all.utils.run-many {
  name = "_.book.check";
  jobs = [
    {command = _.book.build;}
  ];
}
