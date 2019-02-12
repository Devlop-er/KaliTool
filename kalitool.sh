#!/bin/bash

echo -e "
██╗  ██╗ █████╗ ████████╗ █████╗ ██╗  ██╗██████╗
██║  ██║██╔══██╗╚══██╔══╝██╔══██╗██║ ██╔╝██╔══██╗
███████║███████║   ██║   ███████║█████╔╝ ██████╔╝
██╔══██║██╔══██║   ██║   ██╔══██║██╔═██╗ ██╔══██╗
██║  ██║██║  ██║   ██║   ██║  ██║██║  ██╗██║  ██║██╗
╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝

-------- Boite à outils de Pentest -----------------

"

echo -e "Appuyer sur \e[32mENTRER \e[0mpour continuer, \033[31mCTRL+C\e[0m pour annuler."
read input
clear

# Différentes fonctions pour le lancement des commandes

whois(){
  gnome-terminal --tab -e "bash -c 'xdg-open https://whois.domaintools.com/; bash'"
}

techno(){
  gnome-terminal --tab -e "bash -c 'xdg-open https://toolbar.netcraft.com/site_report; bash'"
}

dns(){
  gnome-terminal --tab -e "bash -c 'xdg-open     https://mxtoolbox.com/dnscheck.aspx; bash'"
}

sous-domaine(){
  gnome-terminal --tab -e "bash -c 'sudo apt-get install python-dnspython; bash'"
  gnome-terminal --tab -e "bash -c 'git clone https://github.com/guelfoweb/knock.git; bash'"
  gnome-terminal --tab -e "bash -c 'cd knock; bash'"
  sudo python setup.py install
}

dirb(){
  exec dirb
}

maltego(){
  gnome-terminal --tab -e "bash -c 'maltego; bash'"
}


# Afficher le menu
while :
do
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo " M E N U - P R I N C I P A L "
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n"
echo -e "1. Récupération d'informations \n"
echo -e "2. Recherche de vulnérabilités \n"
echo -e "99. Sortir \n"
echo -e "\e[32mVeuillez faire un choix \e[0m > "

read choice
clear
case $choice in
    "1")
    while :
    do
      clear
      echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      echo " RÉCUPÉRATION D'INFORMATIONS "
      echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n"
      echo -e "Dans cette partie vous avez à disposition une liste de script
permettant de récupérer de précieuses informations sur une cible.\n"
      echo -e "1. \033[31mWHOIS\e[0m          Obtenir des informations sur une cible (Nom & Prénom du propriétaire | Numéro de téléphone | Adresse )"
      echo -e "2. \033[31mTECHNOLOGIES\e[0m   Analyser les technologies utilisée sur un site web (Php | Javascript | Mysql )"
      echo -e "3. \033[31mDNS\e[0m            Analyser informations liées aux DNS"
      echo -e "4. \033[31mSOUS-DOMAINE\e[0m   Découvrir des sous-domaines (Knock)"
      echo -e "5. \033[31mFICHIERS SENSIBLES\e[0m   Découvrir des fichiers sensibles (Dirb) \n"
      echo -e "6. \033[31mMALTEGO\e[0m   Logiciel spécialisé dans la récupération d'informations \n"
      echo -e "99. Retour \n"
      echo -e "Veuillez faire un choix > \n"
    read choice1
    clear
        case $choice1 in
        "1")
        whois
        ;;
        "2")
        clear
        techno
        ;;
        "3")
        dns
        ;;
        "4")
        sous-domaine
        ;;
        "5")
        dirb
        ;;
        "6")
        maltego
        ;;
        "99")
        break
        ;;
    esac
    done
    ;;
    "99")
    exit
    ;;
esac
done
