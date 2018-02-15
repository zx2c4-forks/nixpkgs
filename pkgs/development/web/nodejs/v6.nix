{ stdenv, callPackage, lib, enableNpm ? true, openssl_1_0_2 }:

let
  buildNodejs = callPackage ./nodejs.nix { openssl = openssl_1_0_2; };
in
  buildNodejs {
    inherit enableNpm;
    version = "6.12.3";
    sha256 = "1p6w7ngp95lc3ksyklp1mwyq1f02vz62r1h60g1ri00pl8pnfn0s";
    patches = lib.optionals stdenv.isDarwin [ ./no-xcode.patch ];
  }
