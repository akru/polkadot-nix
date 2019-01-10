{ stdenv
, fetchFromGitHub
, rustPlatform
, llvmPackages
, pkgconfig
, openssl
, clang
}:

rustPlatform.buildRustPackage rec {
  name = "${pname}-${version}";
  pname = "robonomics-node";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "airalab";
    repo = "substrate-node-robonomics";
    rev = "84c6e82a0fd23ebdc7140866fd4b6aab3577f914";
    sha256 = "18iaxd8xz8h6c842ypl6r5inkcf8z4wp87akdjfsrf029q7kxv4a";
  }; 

  cargoSha256 = "106a08yjlz65xpg0dylxc3z28lkfcbjg7nkkj2b207gidd91yshi";

  buildInputs = [ pkgconfig openssl openssl.dev clang ];
  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  meta = with stdenv.lib; {
    description = "Robonomics on substrate: PoC";
    homepage = https://github.com/airalab/substrate-node-robonomics;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
    platforms = platforms.linux;
  };
}
