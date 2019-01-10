{ stdenv
, fetchFromGitHub
, rustPlatform
, llvmPackages
, pkgconfig
, openssl
, clang
}:

let
  rev = "b5f7e4c302c9909024750e92a815be434af02ec9";

in rustPlatform.buildRustPackage rec {
  name = "substrate-node-${version}";
  version = builtins.substring 0 8 rev;

  src = fetchFromGitHub {
    owner = "paritytech";
    repo = "substrate";
    sha256 = "0vxzi0i9mav5kx6ch63iy0qgv4xk2lz9p3h1573bxxyiylv37hi9";
    inherit rev;
  }; 

  cargoSha256 = "05bjyiqsbxv9ylg0dnkn0f252wn5kga5sr43q2wlvw4zxa9kp8iz";

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
