## Example usage of Bazel + Nix + Python

This example uses [Nix](https://nixos.org/) and [rules_nixpkgs](https://github.com/tweag/rules_nixpkgs) to provide a Python interpreter for Bazel.

The Nix-provided interpreter is used both when fetching python packages (see the `py_deps` `WORKSPACE` rule) and to construct a Python toolchain (see `//:BUILD.bazel`).

There's a single test under `app` which tests some Pandas usage. Pandas depends on, among other things, libstdc++, which is not provided by default with the Nix python package.

See `//:python39.nix` for the steps used to build an environment around a Python 3.9 interpreter. Specifically, the `stdenv.cc.cc.lib` nix package provides libstdc++. Removing that line from `python39.nix` will result in the python test failing.

Note that you'll need to install Nix separately. Follow the instructions at [nixos.org](https://nixos.org/download.html).
