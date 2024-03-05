#! /bin/bash

bar="▁▂▃▄▅▆▇█"

# Crear diccionario para reemplazar el índice con el carácter de la barra
dict="s/;//g;"
for ((i = 0; i < ${#bar}; i++)); do
    dict="${dict}s/$i/${bar:$i:1}/g;"
done

# Escribir configuración de cava
config_file="/tmp/polybar_cava_config"
echo "
[general]
bars = 10

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
" >$config_file

# Leer la salida estándar de cava y mostrar las barras
cava -p $config_file | while read -r line; do
    echo $line | sed $dict
done
