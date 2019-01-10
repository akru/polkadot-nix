{ stdenv
, fetchFromGitHub
, rustPlatform
, pkgconfig
, openssl
}:

rustPlatform.buildRustPackage rec {
  name = "polkadot-${version}";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "paritytech";
    repo = "polkadot";
    rev = "1e803cd1eaee41956327f8f71ca2742e89317238";
    sha256 = "1fv34jcd22sm6ik3zanv2a0fllfc2h0xjz05k67lx21m706bws9g";
  }; 

  cargoSha256 = "00wkaxqj2v5zach5xcqfzf6prc0gxy2v47janglp44xbxbx9xk08";

  buildInputs = [ pkgconfig openssl openssl.dev ];

  meta = with stdenv.lib; {
    description = "Polkadot Node Implementation";
    homepage = http://polkadot.network;
    license = licenses.gpl3;
    maintainers = [ maintainers.akru ];
    platforms = platforms.linux;
  };
}
