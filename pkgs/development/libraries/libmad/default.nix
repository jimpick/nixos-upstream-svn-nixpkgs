{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "libmad-0.15.1b";
  src = fetchurl {
    url = mirror://sourceforge/mad/libmad-0.15.1b.tar.gz;
    sha256 = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690";
  };

  buildInputs = [];

  meta = {
    description = "MAD, a high-quality, fixed-point, MPEG audio decoder
                   supporting MPEG-1 and MPEG-2.";
  };
}
