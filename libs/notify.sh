#!/bin/bash

Notify() {
    echo ""

    if [[ $2 ]]; then
        echo -e "$2===> $1 $NC"
    else
        echo -e "$WHI===> $1 $NC"
    fi

    echo ""
}

NotifyInfo() {
    echo -e "$B_BLU===> $1 $NC"
    echo ""
}

NotifySuccess() {
    echo -e "$B_GRE===> $1 $NC"
    echo ""
}

NotifyError() {
    echo -e "$B_RED===> $1 $NC"
    echo ""
}

NotifyAsk() {
    echo ""
    echo ""
    echo -e "$B_YELLOW===> $1 $NC"
}