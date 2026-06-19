{_, ...}: {
  paths = "apps/fake-server-b/";
  command = _."fake-server-b".check;
}
