#!/bin/bash

set -e

read -p "Please type in a file name: " file_name
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

file_path=~/.ssh/$file_name
ssh-keygen -t "$crypto" -a 100 -f $file_path
echo "SSH key generated and saved as $file_path"

