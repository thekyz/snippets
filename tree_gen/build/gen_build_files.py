import jinja2
import json
import sys

loader = jinja2.FileSystemLoader(searchpath='./')
env = jinja2.Environment(loader=loader)
template = env.get_template(sys.argv[1])

with open(sys.argv[2]) as json_file:
    data = json.load(json_file)

build_render = template.render(data)

with open(sys.argv[3], 'w') as build_file:
    build_file.write(build_render)
