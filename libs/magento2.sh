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

VerifyPV() {
  if command -v pv > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
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
  if VerifyPV "$1" == 0 ; then echo -e "$B_GRE pv Installed $NC"; else echo -e "$B_RED pv Not Installed, execute command: sudo apt install pv $NC"; fi
}

MinervaStart() {
  Notify "Inicializando containers do Magento 2 $CONTAINER"
  cd "$PROJECT" && sudo apachectl stop && sudo sysctl -w vm.max_map_count=262144 && sudo docker-compose up -d --remove-orphans
}

MinervaStop() {
  Notify "Parando containers do Magento 2 $CONTAINER"
  cd "$PROJECT" && docker-compose stop
}

MinervaSSH() {
  Notify "Acessando SSH $CONTAINER"
  CONTAINER=$(echo $PROJECT | cut -d "/" -f5)
  sudo docker exec -it "${CONTAINER}"_fpm_1 /bin/bash
}

Dump() {
  NotifyAsk "Gostaria de importar pelo magento-cloud? y/n"
  read -t "$WAIT_TIME" MAGE_CLOUD
  case "$MAGE_CLOUD" in
    y|Y)
      NotifyAsk "Qual ambiente deseja?"
      read -t "$WAIT_TIME" ENVIRONMENT
      Notify "Copiando para a raiz da loja"
      magento-cloud db:dump -p s64qx6qcjx7ae -e "$ENVIRONMENT" -r database
      case "$ENVIRONMENT" in
        production|production)
          cp s64qx6qcjx7ae--production-vohbr3y--s64qx6qcjx7ae--dump.sql "$PROJECT"/db.sql
        ;;
        staging|STAGING)
          cp s64qx6qcjx7ae--staging-5em2ouy--s64qx6qcjx7ae_stg--dump.sql "$PROJECT"/db.sql
        ;;
        staging2|STAGING2)
          cp s64qx6qcjx7ae--staging2-5zxmgzy--s64qx6qcjx7ae_stg2--dump.sql "$PROJECT"/db.sql
        ;;
      esac
      sleep 5
      importDump
    ;;
    n|N)
      FILE="$PROJECT"/db.sql
      if [ -f "$FILE" ]; then
        NotifySuccess "O ultimo que dump foi gerado: $(date -r "$PROJECT"/db.sql '+%m-%d-%Y %H:%M:%S')"
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
  docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "chmod -R 777 var pub"
  FILE="$PROJECT"/db.sql
  CONTAINER=$(echo $PROJECT | cut -d "/" -f5)
  if [ -f "$FILE" ]; then
    # Importa o dump SQL diretamente no container do banco de dados
    cd "${PROJECT}" && sed -i 's/DEFINER=[^*]*\*/\*/g' "$FILE"
    cat "$FILE" | pv | docker exec -i minerva-magento2_db_1 /bin/bash -c "mysql -u root -pmagento2 magento2"

    # Executa comandos adicionais para configurar o ambiente Magento
    CommandsCompile
    ChangeUrl
    DisableModulesUnnecessaryForLocal
    Notify "Setando configs padrões para o ambiente $CONTAINER"

    # Executa comandos no container para setar configs
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento config:set --scope=websites --scope-code=base backoffice/api/key ${KEY_CUSTOMER_ORDER_MINERVA}"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c 'bin/magento config:set --scope=stores --scope-code=default web/cookie/cookie_domain ""'
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento config:set web/url/use_store 1"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento cache:clean config"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento config:set web/url/use_store 0"

    # Cria um usuário admin no Magento
    Notify "Setando usuario ${BLU}admin${NC} e senha ${BLU}admin123${NC}"
    docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "php bin/magento admin:user:create --admin-user=admin --admin-password=admin123 --admin-email=hi@mageplaza.com --admin-firstname=Mageplaza --admin-lastname=Family"

    # Altera a senha de um customer específico
    Notify "Alterando senha do customer ${BLU}$CUSTOMER_EMAIL_CHANGE_PASSWORD${NC} para ${BLU}teste${NC}"
    docker exec -i "${CONTAINER}"_db_1 mysql -u root -pmagento2 -e "UPDATE $DATABASE.customer_entity SET password_hash = CONCAT(SHA2('xxxxxxxxteste', 256), ':xxxxxxxx:1') WHERE email = '$CUSTOMER_EMAIL_CHANGE_PASSWORD'";

    # Lista as URLs base das lojas
    cd "${PROJECT}" && n98-magerun2.phar sys:store:config:base-url:list
    NotifySuccess "Realizado o Dump com sucesso acesse ${URL_LOCAL}"
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
  if [ "$CONTAINER" == "oaz" ]; then
    cp oaz/docker-compose.yml "$PROJECT"/docker-compose.yml
    sleep 1
    cp oaz/env.php "$PROJECT"/app/etc/env.php
  else
    cp minerva/docker-compose.yml "$PROJECT"/docker-compose.yml
    sleep 1
    cp minerva/env.php "$PROJECT"/app/etc/env.php
  fi
  NotifySuccess "Configurado!"
}

CommandsCompile() {
  Notify "Executando s:up, s:di:c e ind:rei"
  CONTAINER=$(echo $PROJECT | cut -d "/" -f5)
  docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento s:up && bin/magento s:di:c && bin/magento ind:rei"
}

GruntInstall() {
  Notify "Realizando instalação do grunt"
  cd utils
  cp themes.js "$PROJECT"/app/etc
  cp package.json "$PROJECT"
  cp Gruntfile.js "$PROJECT"
  cp grunt-config.json "$PROJECT"
  docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "npm install"
}

GruntExec() {
  NotifyAsk "Digite o nome do tema"
  read THEME_NAME
  Notify "Compilando..."
  docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "grunt exec:$THEME_NAME && grunt less:$THEME_NAME && grunt watch:$THEME_NAME"
}

ChangePasswordAllCustomers() {
  Notify "Alterando todos as senhas dos customers para [teste]"
  docker exec -i "${CONTAINER}"_db_1 mysql -u root -pmagento2 -e "UPDATE $DATABASE.customer_entity SET password_hash = CONCAT(SHA2('xxxxxxxxteste', 256), ':xxxxxxxx:1') WHERE entity_id != 1;"
  sleep 1
  NotifySuccess "Alterado com sucesso"
}

ChangeBaseUrl() {
  NotifyAsk "Digite a url"
  read URL
  Notify "Alterando todos as base urls para https://${URL}/"
  docker exec -i "${CONTAINER}"_db_1 mysql -u root -pmagento2 -e "UPDATE $DATABASE.core_config_data SET value = '${URL}' WHERE path  LIKE '%secure/base_%' AND path NOT LIKE 'web/secure/base_static_url' AND path NOT LIKE 'web/secure/base_media_url' AND path NOT LIKE 'web/unsecure/base_media_url' AND path NOT LIKE 'web/unsecure/base_static_url';"
  sleep 1
  NotifySuccess "Alterado com sucesso"
}

ChangeUrl() {
  Notify "Alterando todos as base urls para ${URL_LOCAL}"
  docker exec -i "${CONTAINER}"_db_1 mysql -u root -pmagento2 -e "UPDATE $DATABASE.core_config_data SET value = '${URL_LOCAL}' WHERE path  LIKE '%secure/base_%' AND path NOT LIKE 'web/secure/base_static_url' AND path NOT LIKE 'web/secure/base_media_url' AND path NOT LIKE 'web/unsecure/base_media_url' AND path NOT LIKE 'web/unsecure/base_static_url';"
}

DisableModulesUnnecessaryForLocal() {
  Notify "Desabilitando módulos Auth para não impactar na local"
  docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento module:disable Magento_TwoFactorAuth"
  docker exec -it "${CONTAINER}"_fpm_1 /bin/bash -c "bin/magento module:disable Minerva_CustomTwoFactorAuth"
}

ChangeProject() {
  NotifyAsk "Selecione o projeto:"
  echo -e "          [1] Minerva"
  echo -e "          [2] OAZ"
  read P_NAME
  case $P_NAME in
    1)
        ActionChangeProject "minerva-magento2"
    ;;
    2)
      ActionChangeProject "oaz"
    ;;
  esac
}

ActionChangeProject() {
  Notify "Alterando o escopo do projeto... $1"
  local OLD_LINE_PATTERN=PROJECT
  local NEW_LINE="PROJECT=$HOME/Documentos/$1"
  local FILE=$HOME/Documentos/VesselPrivate/.env
  local NEW=$(echo "${NEW_LINE}" | sed 's/\//\\\//g')
  touch "${FILE}"
  sed -i '/'"${OLD_LINE_PATTERN}"'/{s/.*/'"${NEW}"'/;h};${x;/./{x;q100};x}' "${FILE}"
  if [[ $? -ne 100 ]] && [[ ${NEW_LINE} != '' ]]
  then
    echo "${NEW_LINE}" >> "${FILE}"
  fi
}

RunCron() {
  NotifyAsk "Digite o nome da cron para executar"
  read C_NAME
  cd "${PROJECT}" && sudo n98-magerun2.phar sys:cron:run "$C_NAME"
}

CloneProjects () {
    Notify "Buscando projetos do Workspace: $B_BLUE $WORKSPACE_BITBUCKET"
    API_URL="https://api.bitbucket.org/2.0/repositories/$WORKSPACE_BITBUCKET"
    DEST_DIR="$HOME/Documentos"

    SCRIPT_DIR="$(dirname "$(realpath "$0")")"
    JQ_PATH="$SCRIPT_DIR/utils/jq"

    repo_list=$(curl -u "$USER_BITBUCKET:$PASSWORD_BITBUCKET" -s "$API_URL" | "$JQ_PATH" -r '.values[] | .name + " " + .links.clone[1].href')
    if [ $? -ne 0 ]; then
        echo "Erro ao processar a resposta JSON. Verifique se o Workspace esta configurado corretamente."
        exit 1
    fi

    IFS=$'\n' read -rd '' -a repos <<<"$repo_list"
    echo "Selecione um projeto para clonar:"
    for i in "${!repos[@]}"; do
        echo "[$((i+1))] ${repos[$i]}"
    done

    read selection

    if [[ "$selection" -ge 1 && "$selection" -le "${#repos[@]}" ]]; then
        repo_info="${repos[$((selection-1))]}"
        repo_name=$(echo "$repo_info" | awk '{print $1}')
        repo_url=$(echo "$repo_info" | awk '{print $NF}')

        if [ -d "$DEST_DIR/$repo_name" ]; then
            echo "O repositório '$repo_name' já existe em '$DEST_DIR'."
        else
            git clone "$repo_url" "$DEST_DIR/$repo_name"
            echo "Repositório '$repo_name' clonado com sucesso em '$DEST_DIR'."
        fi
    else
        echo "Seleção inválida. Saindo..."
        exit 1
    fi
}

CleanTablesLogsMagento() {
    log_tables=(
        "adminnotification_inbox"
        "customer_log"
        "customer_visitor"
        "elasticsuite_tracker_log_customer_link"
        "magento_bulk"
        "magento_logging_event"
        "magento_logging_event_changes"
        "mageplaza_smtp_log"
        "minerva_checkout_error_logs"
        "queue_message"
        "report_event"
        "webapi_logs"
    )

    Notify "Limpando tabelas de logs do Magento..."

    for table in "${log_tables[@]}"; do
        echo -e "Limpando tabela: $table"
        docker exec -i "${CONTAINER}"_db_1 mysql -u root -pmagento2 -e "DELETE FROM $DATABASE.$table;"
        if [ $? -eq 0 ]; then
            echo -e "${B_GRE}Tabela $table limpa com sucesso.${NC}\n"
        else
            echo -e  "${B_RED} Erro ao limpar a tabela $table.${NC}\n"
        fi
    done
    NotifySuccess "Processo de limpeza concluído.\n"
}

Backup() {
    BACKUP_DIR="backup"
    mkdir -p "$BACKUP_DIR"
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    DB_BACKUP_FILE="$BACKUP_DIR/${DATABASE}_backup_$TIMESTAMP.sql.gz"
    FILES_BACKUP_FILE="$BACKUP_DIR/project_backup_$TIMESTAMP.tar.gz"

    echo -e "\nIniciando backup do banco de dados...\n"

    docker exec ${CONTAINER}_db_1 /usr/bin/mysqldump -u root -p"magento2" "$DATABASE" | pv | gzip > "$DB_BACKUP_FILE"
    if [ $? -eq 0 ]; then
        NotifyInfo "Backup do banco de dados concluído com sucesso: $DB_BACKUP_FILE\n"
    else
        NotifyError "${B_RED}Erro ao realizar o backup do banco de dados.${NC}\n"
        return 1
    fi

    echo -e "\nIniciando backup dos arquivos do projeto...\n"

    tar -cf - -C "$PROJECT" . | pv | gzip > "$FILES_BACKUP_FILE"
    if [ $? -eq 0 ]; then
        NotifyInfo "Backup dos arquivos do projeto concluído com sucesso: $FILES_BACKUP_FILE\n"
    else
        NotifyError "${B_RED}Erro ao realizar o backup dos arquivos do projeto.${NC}\n"
        return 1
    fi

    NotifySuccess "${B_GRE}Processo de backup concluído com sucesso.${NC}\n"
}

Adminer() {
    cd utils
    cd Adminer
    echo "Opening Adminer at http://127.0.0.41:8082/adminer.php"
    xdg-open "http://127.0.0.41:8082/adminer.php" &> /dev/null
    php -S 127.0.0.41:8082 -t .
}
