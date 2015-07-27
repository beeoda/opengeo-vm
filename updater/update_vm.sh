#!/bin/bash

VERBOSE=0
dirs="open-geo-tutorial opengeo-vm scripts tutorials roi_plugin"


function usage() {

    cat << EOF

    Usage: $0 [options]

    This script will update all software provided by Chris Holden
    by pulling the latest copies from his Github repositories.

    Options:
        -v      Be verbose
        -h      Show help

EOF

}

function main() {

    cd $HOME/Documents

    for d in $dirs; do
        cd $d
        echo "Updating: $d"
        if [ $VERBOSE -eq 0 ]; then
            git fetch -q --all
            git reset --hard origin/master 
            if [ -f Makefile ]; then
                make 2>&1 > /dev/null
                make deploy 2>&1 > /dev/null
            fi
        else
            git fetch --all
            git reset --hard origin/master
            if [ -f Makefile ]; then
                make
                make deploy
            fi
        fi
        cd $HOME/Documents
    done
}

while getopts "hv" opt; do
    case $opt in
    h)
        usage
        exit 0
        ;;
    v)
        VERBOSE=1
        ;;
    esac
done

shift $(($OPTIND -1))

set -e

if [ $VERBOSE -eq 1 ]; then
    echo "Updating software in $HOME/Documents/"
fi

main

wait

echo -e "\n"
read -p "Updated. Press any key to close..."
