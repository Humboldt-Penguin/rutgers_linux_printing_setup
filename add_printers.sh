#!/bin/bash

echo
read -p    "Enter your NetID: " NETID
read -s -p "Enter your password: " PASSWORD
echo -e "\n"

lpadmin \
    -p nb_bw \
    -v ipps://${NETID}:${PASSWORD}@mobilityprint.rad.rutgers.edu:9164/printers/nb_bw \
    -m drv:///cupsfilters.drv/pwgrast.ppd \
    -o printer-is-shared=false \
    -o ErrorPolicy=stop-printer \
    -E

lpadmin \
    -p nb_color \
    -v ipps://${NETID}:${PASSWORD}@mobilityprint.rad.rutgers.edu:9164/printers/nb_color \
    -m drv:///cupsfilters.drv/pwgrast.ppd \
    -o printer-is-shared=false \
    -o ErrorPolicy=stop-printer \
    -E

echo

if [ $? -eq 0 ]; then
    echo "Printers 'nb_bw' and 'nb_color' have been successfully added."
else
    echo "Failed somewhere. Good luck lol (try using your DE's GUI)."
fi

echo
