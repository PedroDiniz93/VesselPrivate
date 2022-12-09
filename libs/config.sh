#!/bin/bash

VER="0.7.5"
V_PATH=$(dirname "$0")
V_LIBS_PATH=${V_PATH}/libs

V_M1_PATH=${V_PATH}/magento1
V_M2_PATH=${V_PATH}/magento2

V_M1_WWW_PATH=${V_M1_PATH}/data/www
V_M2_WWW_PATH=${V_M2_PATH}/data/www

V_ALIAS="alias vessel='${V_PATH}/vessel.sh'"

GITLAB_BASE_URL=https://gitlab.com/api/v4/

MySQLConn="mysql -h mysql -uroot -pmagento"

source ${V_PATH}/.env
source ${V_LIBS_PATH}/color.sh
source ${V_LIBS_PATH}/menu.sh
source ${V_LIBS_PATH}/notify.sh
source ${V_LIBS_PATH}/common.sh
source ${V_LIBS_PATH}/magento1.sh
source ${V_LIBS_PATH}/magento2.sh
