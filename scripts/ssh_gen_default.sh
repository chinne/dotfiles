#!/bin/bash

set -e

read -p "Please type in a author (e.g. linux-pc): " author
echo

cryptography_algorithms=("dsa" "ecdsa" "ecdsa-sk" "ed25519" "ed25519-sk" "rsa" "Quit")

PS3="Select a cryptography algorithm (or 'Quit' to exit): "

select ITEM in "${cryptography_algorithms[@]}"; do
    case $ITEM in
        "Quit")
            echo "Exiting..."
            exit 0
            ;;
        *)
            crypto="$ITEM"
            break
            ;;
    esac
done

ssh-keygen -t "$crypto" -a 100 -C "$author"
echo "SSH key generated and saved"

