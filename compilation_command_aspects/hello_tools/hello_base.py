#!/usr/bin/env python3

import sys


def hello_base(args):
    src = args[1]
    cmd = args[2]
    outfile = args[3]

    with open(outfile, 'w') as out:
        out.write("=== Source content:\n")
        with open(src, 'r') as s:
            out.write(s.read() + '\n')
        out.write("=== is compiled by:\n")
        out.write(cmd)


if __name__ == "__main__":
    hello_base(sys.argv)
