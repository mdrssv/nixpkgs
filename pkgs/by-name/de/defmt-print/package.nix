{
  lib,
  rustPlatform,
  fetchFromGitHub,
  fetchCrate,
  pkg-config,
  udev,
  installShellFiles,
  versionCheckHook,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "defmt-print";
  version = "1.0.0";

  src = fetchCrate {
    inherit (finalAttrs) pname version;
    sha256 = "sha256-rio5kAL6NR7vBtjPF0GxDcINeWw+LuZWe7nFN0UkdBg=";
  };

  cargoHash = "sha256-whKaubZRJTHxS/eULsnpYpM+VQPIuofPZtsb29/gIUk=";


  meta = {
    description = "A tool that decodes defmt logs and prints them to the console";
    homepage = "https://github.com/knurling-rs/defmt";
    changelog = "https://github.com/knurling-rs/defmt/defmt-v${finalAttrs.version}";
    license = with lib.licenses; [
      mit
      asl20
    ];
    mainProgram = "defmt-print";
    maintainers = with lib.maintainers; [
    ];
  };
})
