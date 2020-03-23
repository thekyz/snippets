MCU = "atmega1284p"
F_CPU = "11059200"

COPTS = [
    "-mmcu="+MCU, "-DF_CPU="+F_CPU,
    "-c",
    "-Os",
    "-Wall", "-Werror", "-Wextra",
]

LINKOPTS = [
    "-mmcu="+MCU, "-DF_CPU="+F_CPU,
]
