#!/usr/bin/env bash

CleanVars() {
  unset G_NAME
  unset P_NAME
  unset GIT_URL
}

GoHome() {
  NotifyAsk "Pressione ENTER para voltar"
  read -p "$*"
  Main
}
