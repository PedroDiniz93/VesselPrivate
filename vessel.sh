#!/bin/bash

V_PATH=$(dirname "$0")

cd ${V_PATH}

source ./libs/config.sh

Main() {
  CleanVars && clear && sleep 0.2 && ShowMenu

  NotifyAsk "Digite o comando (exemplo: 1):"

  read opt
  case $opt in

    1|q)
      clear && verifyPackages && GoHome
    ;;

    2|w)
      clear && MinervaStart && GoHome
    ;;

    3|e)
      clear && MinervaStop && GoHome
    ;;

    4|r)
      clear && Dump && GoHome
    ;;

    5|t)
      clear && MinervaSSH
    ;;

    6|y)
      clear && M2InstallStore && GoHome
    ;;

    7|u)
      clear && ReadHost && GoHome
    ;;

    99)
      clear && clearDocker && GoHome
    ;;

    Q|q|quit|exit)
      NotifyAsk "Tem certeza que deseja sair? y/n [default yes]"
      read SNE
      case $SNE in
        y|"")
          clear
          exit
        ;;
        n|N)
          Main
        ;;
        *)
          NotifyError "Comando desconhecido"
          Main
        ;;
      esac
    ;;

    *)
      NotifyError "Comando desconhecido"
      Main
    ;;
  esac
}
Main
