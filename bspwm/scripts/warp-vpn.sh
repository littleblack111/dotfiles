#!/usr/bin/env bash

case "$1" in
    --connect)
        if [[ $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}') == "Connecting" ]]; then
            notify-send "Vpn already connected"
        else
            notify-send "Vpn connecting..."
            warp-cli connect
            notify-send "Vpn connected"
        fi
        ;;
    --disconnect)
        if [[ $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}') == "Disconnected" ]]; then
            notify-send "Vpn is not connected"
        else
            notify-send "Vpn disconnecting..."
            warp-cli disconnect
            notify-send "Vpn disconnected"
        fi
        ;;
    --toggle)
        if [[ $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}') == "Disconnected" ]]; then
            notify-send "Vpn connecting..."
            warp-cli connect || notify-send "An error had occured during connect" && notify-send "Vpn connected"
        elif [[ $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}') == "Connecting" ]]; then
            notify-send "Vpn disconnecting..."
            warp-cli disconnect || notify-send "An error had occured during disconnect" && notify-send "Vpn disconnected"
        elif [[ $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}') == "Unable to connect" ]]; then
            pass
        else
            notify-send "An error had occured during warp-connect.sh --toggle"
        fi
        ;;
    --status)
        notify-send "Vpn status: $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}')"
        ;;
    --icon)
        if [[ $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}') == "Disconnected" ]]; then
            echo  | tee $HOME/.cache/warp-vpn.status
        elif [[ $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}') == "Connecting" ]]; then
            echo  | tee $HOME/.cache/warp-vpn.status
        elif [[ $(warp-cli status | awk -F ': ' '/Status update:/ {print $2}' | awk -F '.' '{print $1}') == "Unable to connect" ]]; then
            cat $HOME/.cache/warp-vpn.status
        else
            notify-send "An error had occured during warp-connect.sh --icon"
        fi
        ;;
esac
