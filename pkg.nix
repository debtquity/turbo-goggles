{
  lib,
  rustPlatform,
  fetchgit,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "dns";
  version = "0.0.1";
  src = fetchgit {
    url = "file:///Users/darren/Developer/personal/rust/dns";
    rev = "d44de686d0772cae4dfb50535d0ed7817d56d66f";
    hash = "";
  };
  cargoHash = "";

})
