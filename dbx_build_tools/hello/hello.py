#!/usr/bin/env python3

import yaml
print(yaml.__file__)

def say_hello():
    users = [
        {'name': 'John Doe', 'occupation': 'gardener'},
        {'name': 'Lucy Black', 'occupation': 'teacher'},
    ]

    print(yaml.dump(users))
