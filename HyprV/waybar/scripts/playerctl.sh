#!/bin/bash

# Obtener el título y el artista de la música en reproducción utilizando playerctl
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

# Comprobar si se está reproduciendo música
if [[ -n $title && -n $artist ]]; then
    echo "$artist - $title"
else
    echo ""
fi