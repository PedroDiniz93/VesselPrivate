VerifyPHP() {
  which "$PHP_VERSION" | grep -o "$PHP_VERSION" > /dev/null &&  return 0 || return 1
}

VerifyPHPExtension() {
  local extension="$1"
  if [ $(dpkg-query -W -f='${Status}' "$PHP_VERSION"-"${extension}" 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    return 1
  fi
  return 0
}

VerifyComposer() {
  which "composer" | grep -o "composer" > /dev/null &&  return 0 || return 1
}

VerifyDocker() {
  which "docker" | grep -o "docker" > /dev/null &&  return 0 || return 1
}

VerifyDockerCompose() {
  which "docker-compose" | grep -o "docker-compose" > /dev/null &&  return 0 || return 1
}

VerifyN98MageRun() {
  [[ -f /usr/local/bin/n98-magerun2.phar ]] && return 0 || return 1
}

VerifyGit() {
  which "git" | grep -o "git" > /dev/null &&  return 0 || return 1
}

verifyPackages() {
  if VerifyPHP "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION Installed $NC"; else echo -e "$B_RED $PHP_VERSION Not Installed $NC"; fi
  if VerifyPHPExtension "bcmath" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-bcmath Installed $NC"; else echo -e "$B_RED $PHP_VERSION-bcmath Not Installed $NC"; fi
  if VerifyPHPExtension "cli" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-cli Installed $NC"; else echo -e "$B_RED $PHP_VERSION-cli Not Installed $NC"; fi
  if VerifyPHPExtension "common" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-common Installed $NC"; else echo -e "$B_RED $PHP_VERSION-common Not Installed $NC"; fi
  if VerifyPHPExtension "curl" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-curl Installed $NC"; else echo -e "$B_RED $PHP_VERSION-curl Not Installed $NC"; fi
  if VerifyPHPExtension "gd" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-gd Installed $NC"; else echo -e "$B_RED $PHP_VERSION-gd Not Installed $NC"; fi
  if VerifyPHPExtension "intl" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-intl Installed $NC"; else echo -e "$B_RED $PHP_VERSION-intl Not Installed $NC"; fi
  if VerifyPHPExtension "json" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-json Installed $NC"; else echo -e "$B_RED $PHP_VERSION-json Not Installed $NC"; fi
  if VerifyPHPExtension "mbstring" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-mbstring Installed $NC"; else echo -e "$B_RED $PHP_VERSION-mbstring Not Installed $NC"; fi
  if VerifyPHPExtension "mysql" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-mysql Installed $NC"; else echo -e "$B_RED $PHP_VERSION-mysql Not Installed $NC"; fi
  if VerifyPHPExtension "opcache" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-opcache Installed $NC"; else echo -e "$B_RED $PHP_VERSION-opcache Not Installed $NC"; fi
  if VerifyPHPExtension "readline" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-readline Installed $NC"; else echo -e "$B_RED $PHP_VERSION-readline Not Installed $NC"; fi
  if VerifyPHPExtension "soap" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-soap Installed $NC"; else echo -e "$B_RED $PHP_VERSION-soap Not Installed $NC"; fi
  if VerifyPHPExtension "xml" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-xml Installed $NC"; else echo -e "$B_RED $PHP_VERSION-xml Not Installed $NC"; fi
  if VerifyPHPExtension "zip" "$1" == 0 ; then echo -e "$B_GRE $PHP_VERSION-zip Installed $NC"; else echo -e "$B_RED $PHP_VERSION-zip Not Installed $NC"; fi
  if VerifyComposer "$1" == 0 ; then echo -e "$B_GRE Composer Installed $NC"; else echo -e "$B_RED Composer Not Installed, execute commands to install: $NC"; echo -e " curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php"; echo -e ' HASH="curl -sS https://composer.github.io/installer.sig"'; echo -e ' php -r "if (hash_file("SHA384", "/tmp/composer-setup.php") === "$HASH") { echo "Installer verified"; } else { echo "Installer corrupt"; unlink("composer-setup.php"); } echo PHP_EOL;"'; fi
  if VerifyDocker "$1" == 0 ; then echo -e "$B_GRE Docker Installed $NC"; else echo -e "$B_RED Docker Not Installed $NC"; fi
  if VerifyDockerCompose "$1" == 0 ; then echo -e "$B_GRE Docker Compose Installed $NC"; else echo -e "$B_RED Docker Compose Not Installed, execute commands to install: $NC"; echo -e " sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose"; echo -e " sudo chmod +x /usr/local/bin/docker-compose"; echo -e " docker-compose --version";  fi
  if VerifyN98MageRun "$1" == 0 ; then echo -e "$B_GRE n98-magerun2 Installed $NC"; else echo -e "$B_RED n98-magerun2 Not Installed, execute commands to install: $NC"; echo -e " wget https://files.magerun.net/n98-magerun2.phar"; echo -e " chmod +x ./n98-magerun2.phar"; echo -e " sudo cp ./n98-magerun2.phar /usr/local/bin/"; echo -e " n98-magerun2.phar –version"; fi
  if VerifyGit "$1" == 1 ; then echo -e "$B_GRE Git Installed $NC"; else echo -e "$B_RED Git Not Installed, execute command: sudo apt install git $NC"; fi
}

MinervaStart() {
  Notify "Inicializando containers do Magento 2 Minerva"
  cd "$MINERVA_PROJECT" && apachectl stop && sudo service mysql stop && sudo sysctl -w vm.max_map_count=262144 && sudo docker-compose up -d --remove-orphans
}

MinervaStop() {
  Notify "Parando containers do Magento 2 Minerva"
  cd "$MINERVA_PROJECT" && docker-compose stop
}

MinervaSSH() {
  Notify "Acessando SSH"
 CONTAINER=$(echo $MINERVA_PROJECT | cut -d "/" -f5)
  sudo docker exec -it "${CONTAINER}"_fpm_1 /bin/bash
}

Dump() {
  NotifyAsk "Gostaria de importar pelo magento-cloud? y/n"
  read -t "$WAIT_TIME" MAGE_CLOUD
  case "$MAGE_CLOUD" in
    y|Y)
      NotifyAsk "Qual ambiente deseja?"
      read -t "$WAIT_TIME" ENVIRONMENT
      magento-cloud db:dump -p s64qx6qcjx7ae -e "$ENVIRONMENT"
      Notify "Copiando para a raiz da loja"
      case "$ENVIRONMENT" in
        staging|STAGING)
          cp s64qx6qcjx7ae--staging-5em2ouy--mysql--s64qx6qcjx7ae_stg--dump.sql "$MINERVA_PROJECT"/db.sql
        ;;
        staging2|STAGING2)
          cp s64qx6qcjx7ae--staging2-5zxmgzy--mysql--s64qx6qcjx7ae_stg2--dump.sql "$MINERVA_PROJECT"/db.sql
        ;;
      esac
      sleep 5
      importDump
    ;;
    n|N)
      FILE="$MINERVA_PROJECT"/db.sql
      if [ -f "$FILE" ]; then
        NotifySuccess "O ultimo que dump foi gerado: $(date -r "$MINERVA_PROJECT"/db.sql '+%m-%d-%Y %H:%M:%S')"
        NotifyAsk "Deseja importar esse dump? y/n:"
        read -t "$WAIT_TIME" YoN
        case "$YoN" in
          y|Y)
            importDump
          ;;
          n|N)
            GoHome
          ;;
        esac
      else
        NotifyError "Arquivo db.sql não exite na raiz da loja. "
      fi
    ;;
  esac
}

clearDocker() {
  NotifyAsk "Deseja realmente remover os containers? y/n:"
  read -t "$WAIT_TIME" YoN
  case "$YoN" in
    y|Y)
      Notify "Removendo tudo dos containers"
      sudo docker system prune --all --force --volumes
    ;;
    n|N)
      GoHome
    ;;
  esac
}

importDump() {
  Notify "Importando Dump e configurando DB:" "$BLU"
  n98-magerun2.phar --version
  FILE="$MINERVA_PROJECT"/db.sql
  CONTAINER=$(echo $MINERVA_PROJECT | cut -d "/" -f5)
  if [ -f "$FILE" ]; then
    cd "${MINERVA_PROJECT}" && sed -i 's/DEFINER=[^*]*\*/\*/g' "$FILE"
    cd "${MINERVA_PROJECT}" && n98-magerun2.phar db:import "$FILE"
    CommandsCompile
    cd "${MINERVA_PROJECT}" && n98-magerun2.phar config:store:set web/unsecure/base_url "$URL_LOCAL"
    cd "${MINERVA_PROJECT}" && n98-magerun2.phar config:store:set web/secure/base_url "$URL_LOCAL"
    cd "${MINERVA_PROJECT}" && n98-magerun2.phar config:store:set web/unsecure/base_link_url "$URL_LOCAL"
    cd "${MINERVA_PROJECT}" && n98-magerun2.phar config:store:set web/secure/base_link_url "$URL_LOCAL"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento config:set --scope=websites --scope-code=base web/unsecure/base_url ${URL_LOCAL}"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento config:set --scope=websites --scope-code=base web/secure/base_url ${URL_LOCAL}"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento config:set --scope=websites --scope-code=base web/unsecure/base_link_url ${URL_LOCAL}"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento config:set --scope=websites --scope-code=base web/secure/base_link_url ${URL_LOCAL}"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento config:set --scope=websites --scope-code=base backoffice/api/key ${KEY_CUSTOMER_ORDER_MINERVA}"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento cache:clean config"
    Notify "Setando usuario ${BLU}admin${NC} e senha ${BLU}admin123${NC}"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "php bin/magento admin:user:create --admin-user=admin --admin-password=admin123 --admin-email=hi@mageplaza.com --admin-firstname=Mageplaza --admin-lastname=Family"
    Notify "Alterando senha do customer ${BLU}$CUSTOMER_EMAIL_CHANGE_PASSWORD${NC} para ${BLU}teste${NC}"
    cd "${MINERVA_PROJECT}" && n98-magerun2.phar customer:change-password "$CUSTOMER_EMAIL_CHANGE_PASSWORD" teste base

    cd "${MINERVA_PROJECT}" && n98-magerun2.phar sys:store:config:base-url:list
    NotifySuccess "Realizado o Dump com succeso acesse ${URL_LOCAL}"
  else
      echo -e "$B_RED Arquivo db.sql não exite na raiz da loja. $NC"
  fi

}

ReadHost() {
  NotifyAsk "Digite o nome do host (Ex: magento2.docker)"
  read G_NAME
  AddHost "$G_NAME"
}

AddHost() {
  Notify "Inserindo url no Host"
  if [[ $(grep -R "^127.0.0.1 $1" /etc/hosts | wc -l) == 0 ]]; then
    if [ -z "$ROOT_PASSWORD" ]; then
      echo -e "[sudo] password for $USER:"
      read -s PASSWORD
    fi
    echo $ROOT_PASSWORD | sudo -S sh -c "echo \"\n127.0.0.1 $1\" >> /etc/hosts" >/dev/null
    NotifySuccess "Inserido 127.0.0.1 $1"
  else
    NotifyInfo "Host já existente"
  fi
}

ConfigAch() {
  Notify "Configurando docker-compose.yml & env.php"
  cd utils
  cp docker-compose.yml "$MINERVA_PROJECT"/docker-compose.yml
  sleep 1
  cp env.php "$MINERVA_PROJECT"/app/etc/env.php
  NotifySuccess "Configurado!"
}

CommandsCompile() {
  Notify "Executando s:up, s:di:c e ind:rei"
  CONTAINER=$(echo $MINERVA_PROJECT | cut -d "/" -f5)
  docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento s:up && bin/magento s:di:c && bin/magento ind:rei"
}
