{ stdenv
, fetchFromGitHub
, rustPlatform
, pkgconfig
, openssl
}:

rustPlatform.buildRustPackage rec {
  name = "polkadot-${version}";
  version = "nightly";

  src = fetchFromGitHub {
    owner = "paritytech";
    repo = "polkadot";
    rev = "25f0c077c9519d038c40262bd0c148764891ad96";
    sha256 = "11z4qmppllqmympbs48vlycb3z3v4q4nqzv0wasagzpywvrn0kbj";
  }; 

  cargoSha256 = "1yfwzshb0qdh1zybjd816ss6qvfh8mj3rgmk8vd6dsza0wnm36nc";

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
