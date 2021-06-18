with import <nixpkgs> {};

pkgs.buildEnv{
  name = "tms-python39";
  paths = [
    python39
    (hiPrio gcc)  # Higher priority than conflicting tools from bintools
    bintools
    rustc
    stdenv.cc.cc.lib
    glibcLocales
  ];
  buildInputs = [ makeWrapper ];
  postBuild = ''
    for f in python python3; do
      wrapProgram $out/bin/$f \
        --prefix LD_LIBRARY_PATH : "$out/lib" \
        --prefix PATH : "$out/bin" \
        --set CC "$out/bin/gcc" \
        --set CXX "$out/bin/g++" \
        --set LD "$out/bin/ld" \
        --set AR "$out/bin/ar" \
        --set NM "$out/bin/nm" \
        --set RANLIB "$out/bin/ranlib" \
        --set LOCALE_ARCHIVE "$out/lib/locale/locale-archive"
    done
  '';
}

