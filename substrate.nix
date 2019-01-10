{ stdenv
, fetchFromGitHub
, rustPlatform
, llvmPackages
, pkgconfig
, openssl
, clang
}:

let
  rev = "8b0e5d7ca8b3bf4ae2ad26d773e466d5bc30cbaa";

in rustPlatform.buildRustPackage rec {
  name = "substrate-node-${version}";
  version = builtins.substring 0 8 rev;

  src = fetchFromGitHub {
    owner = "paritytech";
    repo = "substrate";
    sha256 = "1z2m2851512pik59aqnk8fgdw5irmp7khfn8zwimg1cn799kzm0h";
    inherit rev;
  }; 

  cargoSha256 = "0d41sg94ivrnkrhmi11b7n3jbh5p242bh15ypfq2ip9q3kkh6wan";

  buildInputs = [ pkgconfig openssl openssl.dev clang ];
  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  meta = with stdenv.lib; {
    description = "Substrate: The platform for blockchain innovators";
    homepage = https://github.com/paritytech/substrate;
    license = licenses.gpl3;
    maintainers = [ maintainers.akru ];
    platforms = platforms.linux;
  };
}
