{ nixpkgs ? import ./fetchNixpkgs.nix { }
, systems ? [ "x86_64-linux" "aarch64-linux" ]
}:

with import nixpkgs { };

let
  forAllSystems = package:
    lib.genAttrs systems (system:
      with import nixpkgs { inherit system; }; callPackage package { }
    );

in rec {
  krumme_lanke = forAllSystems ./krumme_lanke.nix;
  #alexander = forAllSystems ./alexander.nix;
  substrate = forAllSystems ./substrate.nix;
}
