{ pkgs ? import <nixpkgs> { } }:

rec {
  polkadot = pkgs.callPackage ./. { };
}
