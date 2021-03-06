args: with args;
let inherit (args.composableDerivation) composableDerivation edf; in
composableDerivation {
  initial = {

    name = "fltk-2.0.x-r6483";

    src = args.fetchurl {
      url = ftp://ftp.easysw.com/pub/fltk/snapshots/fltk-2.0.x-r6483.tar.bz2;
      sha256 = "1n8b53r5p0zb4sbvr6pj8aasls4zjwksv1sdc3r3pzb20fikp5jb";
    };

    propagatedBuildInputs=[x11 inputproto libXi freeglut];

    buildInputs = [ args.pkgconfig ];

    flags =
      # this could be tidied up (?).. eg why does it require freeglut without glSupport?
      edf { name = "cygwin"; }  #         use the CygWin libraries default=no
      // edf { name = "debug"; }  #          turn on debugging default=no
      // edf { name = "gl"; enable = { buildInputs = [ mesa ]; }; }  #             turn on OpenGL support default=yes
      // edf { name = "shared"; }  #         turn on shared libraries default=no
      // edf { name = "threads"; }  #        enable multi-threading support
      // edf { name = "quartz"; enable = { buildInputs = "quartz"; }; }  # don't konw yet what quartz is #         use Quartz instead of Quickdraw (default=no)
      // edf { name = "largefile"; } #     omit support for large files
      // edf { name = "localjpeg"; disable = { buildInputs = [libjpeg]; }; } #       use local JPEG library, default=auto
      // edf { name = "localzlib"; disable = { buildInputs = [zlib]; }; } #       use local ZLIB library, default=auto
      // edf { name = "localpng"; disable = { buildInputs = [libpng]; }; } #       use local PNG library, default=auto
      // edf { name = "xinerama"; enable = { buildInputs = [libXinerama]; }; } #       turn on Xinerama support default=no
      // edf { name = "xft"; enable = { buildInputs=[libXft]; }; } #            turn on Xft support default=no
      // edf { name = "xdbe"; };  #           turn on Xdbe support default=no
    cfg = {
        largefileSupport = true; # is default
        glSupport = true; # doesn't build without it. Why?
        localjpegSupport = false;
        localzlibSupport = false;
        localpngSupport = false;
        sharedSupport = true;
        threadsSupport = true;
    };

    meta = {
        description = "a C++ cross platform lightweight gui library binding";
        homepage = http://www.fltk.org;
    };
  };
}
