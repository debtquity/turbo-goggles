{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  # ...
  pname = "dns";
  version = "0.0.1";
  src = fetchFromGitHub {
    owner = "debtquity";
    repo = "turbo-goggles";
    rev = "26bc23663c8c31d32c0b69808771a60ec8df3785";
    hash = "";
  };
  cargoHash = "";
  meta = {
    mainProgram = "dns";
  };

})
