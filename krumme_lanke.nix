{ stdenv
, fetchFromGitHub
, rustPlatform
, pkgconfig
, openssl
}:

rustPlatform.buildRustPackage rec {
  name = "polkadot-${version}";
  version = "0.2.17";

  src = fetchFromGitHub {
    owner = "akru";
    repo = "substrate";
    rev = "c7715e3180a7bcb53232bf5b78ca766bec4def63";
    sha256 = "0v7g03rbml2afw0splmyjh9nqpjg0ldjw09hyc0jqd3qlhgxiiyj";
  }; 

  cargoSha256 = "0wwkaxqj2v5zach5xcqfzf6prc0gxy2v47janglp44xbxbx9xk08";

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
