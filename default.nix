with import <nixpkgs> {}; with xlibs;
  
  stdenv.mkDerivation rec {
      name = "wtftw";
      devDependencies = [ xvfb_run x11vnc tigervnc ];
      buildInputs = [ makeWrapper cargo rustc libXinerama libX11 pkgconfig ] ++ devDependencies;
      buildPhase = "cargo build";
      libPath = lib.makeLibraryPath [ libXinerama libX11 ];
      unpackPhase = "true";
  }
