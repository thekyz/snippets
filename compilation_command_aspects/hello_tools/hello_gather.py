#!/usr/bin/env python3

import sys


def hello_gather(args):
    inputs = args[1:-1]
    outfile = args[-1]

    with open(outfile, 'w') as out:
        for input in inputs:
            out.write("======" + input + ':\n')
            with open(input, 'r') as i:
                out.write(i.read() + '\n\n')


if __name__ == "__main__":
    hello_gather(sys.argv)
