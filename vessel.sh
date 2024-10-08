#!/bin/bash

V_PATH=$(dirname "$0")

cd ${V_PATH}

source ./libs/config.sh

# Function to handle errors
handle_error() {
  echo "Error on line $1"
  exit 1
}

# Trap errors
trap 'handle_error $LINENO' ERR

Main() {
  CONTAINER=$(echo $PROJECT | cut -d "/" -f5)
  if [ "$CONTAINER" == "oaz" ]; then
    DATABASE=oaz
    WORKSPACE_BITBUCKET=oazdev
  else
    DATABASE=magento2
    WORKSPACE_BITBUCKET=minervafoodsdev
  fi
  cd ${V_PATH}
  CleanVars && clear && sleep 0.2 && ShowMenu

  NotifyAsk "Digite o comando (exemplo: 1):"

  read opt
  case $opt in
    0|p)
        clear && CommandsCompile && GoHome
    ;;

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
      clear && CloneProjects && GoHome
    ;;

    7|u)
      clear && ReadHost && GoHome
    ;;

    8|i)
        clear && ConfigAch && GoHome
    ;;

    9|o)
        clear && GruntInstall && GoHome
    ;;

    10|qp)
        clear && GruntExec && GoHome
    ;;

    11|qq)
        clear && ChangePasswordAllCustomers && GoHome
    ;;

    12|qw)
        clear && ChangeBaseUrl && GoHome
    ;;

    13|qr)
        clear && DisableModulesUnnecessaryForLocal && GoHome
    ;;

    14|qr)
        clear && ChangeProject && ExecAgain
    ;;

    15|qt)
        clear && RunCron && ExecAgain
    ;;

    16|qy)
        clear && CleanTablesLogsMagento && GoHome
    ;;

    17|qu)
        clear && Backup && GoHome
    ;;

    18|qi)
        clear && Adminer && GoHome
    ;;

    99)
      clear && clearDocker && GoHome
    ;;

    ss|SS)
      clear && SecretCommandsForTest && GoHome
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
