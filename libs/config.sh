#!/bin/bash

VER="0.7.5"
V_PATH=$(dirname "$0")
V_LIBS_PATH=${V_PATH}/libs


V_ALIAS="alias vessel='${V_PATH}/vessel.sh'"

MySQLConn="mysql -h mysql -uroot -pmagento"

source ${V_PATH}/.env
source ${V_LIBS_PATH}/color.sh
source ${V_LIBS_PATH}/logo.sh
source ${V_LIBS_PATH}/menu.sh
source ${V_LIBS_PATH}/notify.sh
source ${V_LIBS_PATH}/common.sh
source ${V_LIBS_PATH}/magento2.sh
