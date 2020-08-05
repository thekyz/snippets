#!/bin/bash

cat >"$1" <<EOL
#include <stdio.h>

#include "helper.h"

void call_helper() {
    printf("Hello from lib!\n");
}
EOL
