{ stdenv, callPackage, lib, enableNpm ? true, openssl_1_0_2 }:

let
  buildNodejs = callPackage ./nodejs.nix { openssl = openssl_1_0_2; };
in
  buildNodejs {
    inherit enableNpm;
    version = "6.12.2";
    sha256 = "1z6sn4b973sxw0h9hd38rjq6cqdkzl5gsd48f793abvarwgpqrrk";
    patches = lib.optionals stdenv.isDarwin [ ./no-xcode.patch ];
  }
