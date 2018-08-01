{ stdenv
, fetchFromGitHub
, rustPlatform
, pkgconfig
, openssl
}:

rustPlatform.buildRustPackage rec {
  name = "polkadot-${version}";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "paritytech";
    repo = "polkadot";
    rev = "v${version}";
    sha256 = "1z26nafnwxzfglgq6h1kp28sy42rgw6kz8rk02iacaaamz26p009";
  }; 

  cargoSha256 = "1yyzk314cdi8alvyl1yvyfzf7iaj8xcqnq15glw7rr87an0lc93p";

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
