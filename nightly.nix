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
    rev = "4af260fea194d807a48f63dbd4b4595d4be91744";
    sha256 = "0488hfg4g10k780j09w3m6835a92fnzllx8saihnqw2vcc5jc552";
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
