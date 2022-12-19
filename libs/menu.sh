#!/bin/bash
ShowMenu() {
    echo -e "$LOGO"
    echo -e "     $B_BLUE               Magento 2               $NC"
    echo ""
    echo -e "          [1] Verificar pacotes necessarios"
    echo -e "          [2] Inicializar containers Minerva"
    echo -e "          [3] Pausar containers Minerva"
    echo -e "          [4] Realizar Dump Minerva"
    echo -e "          [5] Acessar container via ssh"
    echo -e " $YELLOW         [6] Instalar do zero loja minerva (Em Dev) $NC"
    echo -e "          [7] Adicionar loja /etc/hosts"
    echo -e " $B_RED         [99] Zerar todo o docker  $NC"
}
