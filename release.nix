{ nixpkgs ? import <nixpkgs> { }
}:

rec {
  krumme_lanke = nixpkgs.callPackage ./krumme_lanke.nix { };
  alexander = nixpkgs.callPackage ./alexander.nix { };
  substrate = nixpkgs.callPackage ./substrate.nix { };
}
