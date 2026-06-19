{_, ...}: {
  paths = "apps/fake-server-a/";
  command = _."fake-server-a".check;
}
