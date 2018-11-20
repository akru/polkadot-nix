Polkadot Nix port 
=================

[![Build Status](https://travis-ci.org/akru/polkadot-nix.svg?branch=master)](https://travis-ci.org/akru/polkadot-nix)

Nix build scripts for [parity-polkadot](https://github.com/paritytech/polkadot) node.

Build from source
-----------------

    git clone https://github.com/akru/polkadot-nix && cd polkadot-nix
    make 

Install from binary cache
-------------------------

    nix-channel --add https://hydra.aira.life/project/aira/channel/latest aira
    nix-channel --update
    nix-env -i polkadot

