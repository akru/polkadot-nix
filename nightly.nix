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
    rev = "dc1d7a861a3e44e31ba1e18f75d48c04fa8b7e18";
    sha256 = "184njhf4865fy5mlhdik1i0pyk9xfx1jji26x7x02cg5ipqfnznq";
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
