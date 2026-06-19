{_, ...}:
_.all.utils.run-many {
  name = "_.fake-server-b.check";
  jobs = [
    {command = _."fake-server-b".type-check;}
    {command = _."fake-server-b".test;}
    {
      command = _."fake-server-b".build;
      needs = [_."fake-server-b".type-check.name];
    }
  ];
}
