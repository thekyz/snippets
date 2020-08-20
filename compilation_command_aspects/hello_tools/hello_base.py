#!/usr/bin/env python3

import argparse


def hello_base(source, output, command):
    with open(output, 'w') as out:
        out.write("=== Source content:\n")
        with open(source, 'r') as s:
            out.write(s.read() + '\n')
        out.write("=== is compiled by:\n")
        out.write(' '.join(command))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--source', required=True)
    parser.add_argument('--output', required=True)
    parser.add_argument('--command', nargs=argparse.REMAINDER, required=True)
    args = parser.parse_args()
    hello_base(**vars(args))
