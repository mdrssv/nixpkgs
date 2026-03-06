{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  udev,
  installShellFiles,
  versionCheckHook,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "defmt-tcp";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "miathedev";
    repo = "defmt-tcp";
    rev = "v${finalAttrs.version}";
    hash = "sha256-TGOct6vYRH+iKWjV48a7Eur9IAiPmnhc8+PYHdgkdhQ=";
  };

  cargoHash = "sha256-Vk2npz04iRIpQZvjHUajE6w7dUAjKQKar1pdYPOW4Kw=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    udev
  ];

  meta = {
    description = "Prints defmt logs received from a TCP interface";
    homepage = "https://github.com/miathedev/defmt-tcp";
    changelog = "https://github.com/miathedev/defmt-tcp/releases/tag/v${finalAttrs.version}";
    license = with lib.licenses; [
      asl20 # or
      mit
    ];
    mainProgram = "defmt-tcp";
    maintainers = with lib.maintainers; [
    ];
  };
})
