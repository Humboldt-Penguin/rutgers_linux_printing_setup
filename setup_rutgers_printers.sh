#!/bin/bash


## list all currently configured printers.
list_printers() {
    output=$(lpstat -p 2>&1)
    if echo "$output" | grep -q 'No destinations added'; then
        echo "No printers configured."
    else
        echo "$output"
    fi
}


## add 'nb_bw' and 'nb_color' printers.
add_printers() {
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
        echo "You may need to restart CUPS for changes to take effect."
        echo "(safe to ignore warnings: 'lpadmin: Printer drivers are deprecated')"
    else
        echo "Failed somewhere. Good luck lol (try deleting all printers, or use your desktop environment's settings GUI.)."
    fi
}


## delete ONLY 'nb_bw' and 'nb_color' printers.
delete_printers() {
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
}


## restart CUPS.
restart_cups() {
    sudo systemctl restart cups
}


## show the CUPS conf file for debugging (careful, this may contain your netid and password)
show_printer_conf() {
    sudo -v
    echo -e "\n\n"
    sudo cat /etc/cups/printers.conf
    echo -e "\n\n"
}










## display menu
show_menu() {
    echo "----------------------------------------"
    echo "Please select an option:"
    echo "l) List all currently configured printers."
    echo "a) Add 'nb_bw' and 'nb_color' printers."
    echo "d) Delete ONLY 'nb_bw' and 'nb_color' printers."
    echo "r) Restart CUPS."
    echo "s) Show the CUPS conf file for debugging (careful, this may contain your netid and password)."
    echo "q) Quit."
    echo
    read -p "Enter your choice: " choice
    echo "----------------------------------------"
}



## MAIN LOOP

echo
echo "Rutgers Wireless Printer Setup Script for Linux."
echo "    (full repo: https://github.com/Humboldt-Penguin/rutgers_linux_printing_setup)"
echo

if [[ "$(uname)" == "Darwin" ]]; then
    echo "fuck off mac user"
    exit 1
fi

while true; do
    show_menu
    echo
    case $choice in
        l) list_printers ;;
        a) add_printers ;;
        d) delete_printers ;;
        r) restart_cups ;;
        s) show_printer_conf ;;
        # q) echo "Goodbye!"; exit ;;
        q) echo "Go fuck yourself!"; exit ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    echo
done
