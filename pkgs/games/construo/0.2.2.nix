args : with args;
	let localDefs = builderDefs.passthru.function {
		src = /* put a fetchurl here */
		fetchurl {
			url = http://savannah.nongnu.org/download/construo/construo-0.2.2.tar.gz;
			sha256 = "0c661rjasax4ykw77dgqj39jhb4qi48m0bhhdy42vd5a4rfdrcck";
		};

		buildInputs = [libX11 zlib xproto]
		++ (if args ? mesa then [args.mesa args.freeglut] else [])
		;
		configureFlags = [""];
	};
	in with localDefs;
let 
preConfigure = FullDepEntry ("
  sed -e 's/math[.]h/cmath/' -i vector.cxx
  sed -e 's/games/bin/' -i Makefile.in
") [doUnpack minInit];
in
stdenv.mkDerivation rec {
	name = "construo-"+version;
	builder = writeScript (name + "-builder")
		(textClosure localDefs [preConfigure doConfigure doMakeInstall doForceShare doPropagate]);
	meta = {
		description = "
	Construo masses and springs simulation.
";
		inherit src;
	};
}
