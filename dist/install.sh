#!/bin/bash

VESSEL_LOCATION=~/$HOME/vessel
VESSEL_REPO="git@gitlab.com:bis2bis/dev-tools/vessel.git"
VESSEL_ALIAS="alias vessel='${VESSEL_LOCATION}/vessel.sh'"

if [ ! -d "$VESSEL_LOCATION" ] ; then

  clear

  mkdir -p "$VESSEL_LOCATION"

  git clone --depth 1 --single-branch "$VESSEL_REPO" "$VESSEL_LOCATION"

  if [[ -f "~/.bashrc" ]]; then
    if [[ `grep "^$VESSEL_ALIAS$" ~/.bashrc | wc -l` == 0 ]]; then
      echo  ${VESSEL_ALIAS} >> ~/.bashrc
    fi
  fi

  if [[ -f "~/.zshrc" ]]; then
    if [[ `grep "^$VESSEL_ALIAS$" ~/.zshrc | wc -l` == 0 ]]; then
      echo ${VESSEL_ALIAS} >> ~/.zshrc
    fi
  fi

  ${VESSEL_ALIAS}

  echo "Vessel instalado"

else

  if [ -d "$HOME/.bashrc" ]; then
    if [[ `grep -F "^$VESSEL_ALIAS$" ~/.bashrc | wc -l` == 0 ]]; then
      echo  "$VESSEL_ALIAS" >> ~/.bashrc
    fi
  fi

  if [ -d "$HOME/.zshrc" ]; then
    if [[ `grep -F "^$VESSEL_ALIAS$" ~/.zshrc | wc -l` == 0 ]]; then
      echo "$VESSEL_ALIAS" >> ~/.zshrc
    fi
  fi

  cd ${VESSEL_LOCATION} && git pull --rebase --progress

  echo "O Vessel foi atualizado"

fi

sleep 2

chmod a+x ${VESSEL_LOCATION}/libs/*
chmod a+x ${VESSEL_LOCATION}/magento1/autostart/*.sh

echo "Reabra o terminal e o comando 'vessel' estará disponível"

exit 0

