#!/bin/sh

output () {
    styleStart=""
    styleEnd=""
    newLine="\n"
    if [ $# -ge 3 ]; then
      newLine=""
    fi
    if [ "${2:-}" != "" ]; then
    case $2 in
        "success")
            styleStart="\033[0;32m"
            styleEnd="\033[0m"
            ;;
        "error")
            styleStart="\033[31;31m"
            styleEnd="\033[0m"
            ;;
        "info"|"warning")
            styleStart="\033[33m"
            styleEnd="\033[39m"
            ;;
        "heading")
            styleStart="\033[1;33m"
            styleEnd="\033[22;39m"
            ;;
        "highlight")
            styleStart="\033[0;36m"
            styleEnd="\033[22;39m"
            ;;
    esac
    fi

    printf "${styleStart}${1}${styleEnd}${newLine}"
}
