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
    rev = "c04e4b2f24aa03edb68ba75196456e26cd5a7dc6";
    sha256 = "0drymryaapl4xvhxbdajcnnsv1gp6wkl89jxfng2060xi41gwrj3";
  }; 

  cargoSha256 = "1lk2scy2sj6argr33lmj188dl4r3v8vc7psv5gj70vjshl0hakdd";

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
