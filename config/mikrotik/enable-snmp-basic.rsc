# enable-snmp-basic.rsc
# Configuration SNMP v2c read-only pour Zabbix monitoring
# À importer sur MikroTik : /import file=enable-snmp-basic.rsc

# Activer SNMP
/snmp set enabled=yes contact="Projet Zabbix" location="Lab VM"

# Supprimer la community par défaut "public" si elle existe (sécurité)
/snmp community remove [find name="public"]

# Ajouter une community sécurisée, restreinte à l'IP de ton Zabbix server
/snmp community add name="MaCommunauteSecurisee123" \
    addresses="192.168.56.101" \
    read-access=yes \
    write-access=no

# Optionnel : activer les traps si tu veux des notifications push du MikroTik vers Zabbix
# /snmp set trap-target=192.168.56.101 trap-community=MaCommunauteSecurisee123 trap-version=2

:put "SNMP configuré pour Zabbix ! Vérifie avec /snmp print et /snmp community print"
