#!/bin/bash

echo

if lpadmin -x nb_bw 2>/dev/null; then
    echo "'nb_bw' removed."
else
    echo "WARNING: 'nb_bw' could not be found or removed."
fi

if lpadmin -x nb_color 2>/dev/null; then
    echo "'nb_color' removed."
else
    echo "WARNING: 'nb_color' could not be found or removed."
fi

echo
