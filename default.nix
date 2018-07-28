{ stdenv
, fetchFromGitHub
, rustPlatform
, pkgconfig
, openssl
}:

rustPlatform.buildRustPackage rec {
  name = "polkadot-${version}";
  version = "0.2";

  src = fetchFromGitHub {
    owner = "paritytech";
    repo = "polkadot";
    rev = "ff36d2eae2204f21807b45a9381a6b7d0c589fdd";
    sha256 = "1jr15xc8cw4x7k768lq5l75kd58xqk7dmfw8vwj7avv22v7vggza";
  }; 

  cargoSha256 = "06gyxkv2jz3zshhfvnbc2kbb4z33n8xb2c1y7jrfidxkxgnyd6xi";

  patches = [ ./patches/vendored-sources-0.2.patch ];

  buildInputs = [ pkgconfig openssl openssl.dev ];

  # No testing
  doCheck = false;

  meta = with stdenv.lib; {
    description = "Polkadot Node Implementation";
    homepage = http://polkadot.network;
    license = licenses.gpl3;
    maintainers = [ maintainers.akru ];
    platforms = platforms.linux;
  };
}
