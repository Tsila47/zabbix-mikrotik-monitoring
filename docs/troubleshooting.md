# Troubleshooting Guide

Common issues encountered during setup and their solutions:

- **DNS resolution failure (cannot reach api.telegram.org)**  
  → Check `/etc/netplan/` configuration, ensure valid DNS servers (e.g. 8.8.8.8, 1.1.1.1)  
  → Run `sudo netplan apply` and test with `ping api.telegram.org`

- **"cannot get URL" error in Telegram media type**  
  → Verify bot token and chat ID are correct  
  → Test the webhook manually with curl (see Zabbix webhook docs)  
  → Check outbound firewall rules on Zabbix server (port 443 open)

- **No SNMP data / timeout / "SNMP: Timeout"**  
  → Confirm community string matches exactly (case-sensitive)  
  → Check that Zabbix server IP is allowed in MikroTik community addresses  
  → Test SNMP from Zabbix server: `snmpwalk -v2c -c MaCommunauteSecurisee123 IP_DU_MIKROTIK .1.3.6.1.2.1.1`  
  → Ensure UDP port 161 is not blocked by firewall on router or network

- **Low-Level Discovery (LLD) empty – no interfaces/queues discovered**  
  → Verify SNMP access to interface table: `snmpwalk ... .1.3.6.1.2.1.2.2.1` (ifTable)  
  → Increase SNMP timeout in host interface settings (e.g. 5–10s)  
  → Check RouterOS version compatibility (some old versions have SNMP quirks)

- **Triggers / Actions not firing**  
  → Confirm trigger severity matches action conditions  
  → Check user media type is enabled and assigned correctly  
  → Look at **Administration → Audit log** or **Reports → Action log** for clues  
  → Test manually: force a problem by unplugging a cable or disabling an interface

- **Zabbix agent confusion**  
  → For pure SNMP monitoring, **no agent** is needed on the MikroTik – SNMP only!

Add your own issues + fixes here as you encounter them.

If you're still stuck, feel free to open an issue on the GitHub repo!
