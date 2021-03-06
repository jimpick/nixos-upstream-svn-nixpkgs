{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "bzip2-1.0.5";
  
  builder = ./builder.sh;
    
  src = fetchurl {
    url = http://www.bzip.org/1.0.5/bzip2-1.0.5.tar.gz;
    sha256 = "08py2s9vw6dgw457lbklh1vsr3b8x8dlv7d8ygdfaxlx61l57gzp";
  };

  sharedLibrary =
    !stdenv.isDarwin && !(stdenv ? isDietLibC) && stdenv.system != "i686-cygwin";
    
  meta = {
    homepage = http://www.bzip.org;
  };
}
