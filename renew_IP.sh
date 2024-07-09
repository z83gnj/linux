
renew_ip() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: renew_ip <interface1> [<interface2> ...]"
        return 1
    fi

    for interface in "$@"; do
        echo "Renewing IP for interface: $interface"
        sudo dhclient -r "$interface" && sudo dhclient "$interface"
    done
}

renew_all_interfaces() {
    # Get the list of all network interfaces that are up
    interfaces=$(ip -o link show | awk -F': ' '{print $2}' | grep -v 'lo')

    for interface in $interfaces; do
        echo "Renewing IP for interface: $interface"
        sudo dhclient -r "$interface" && sudo dhclient "$interface"
    done
}