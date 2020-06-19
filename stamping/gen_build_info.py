#!/usr/bin/env python3 

import sys
import jinja2

loader = jinja2.FileSystemLoader(searchpath='./')
env = jinja2.Environment(loader=loader)
template = env.get_template(sys.argv[1])

data = {}
with open(sys.argv[2]) as data_file:
    for line in data_file:
        line_split = line.strip().split(" ")

        k = line_split[0]
        v = line_split[1]

        data[k] = v


build_render = template.render({"build_data": data})

with open(sys.argv[3], 'w') as build_file:
    build_file.write(build_render)
