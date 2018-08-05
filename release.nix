{ pkgs ? import <nixpkgs> { } }:

rec {
  polkadot-nightly = pkgs.callPackage ./nightly.nix { };
  polkadot = pkgs.callPackage ./. { };
}
