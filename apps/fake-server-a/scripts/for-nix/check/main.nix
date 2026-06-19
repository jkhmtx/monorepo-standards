{_, ...}:
_.all.utils.run-many {
  name = "_.fake-server-a.check";
  jobs = [
    {command = _."fake-server-a".type-check;}
    {command = _."fake-server-a".test;}
    {
      command = _."fake-server-a".build;
      needs = [_."fake-server-a".type-check.name];
    }
  ];
}
