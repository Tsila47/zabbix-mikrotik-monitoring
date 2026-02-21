# Detailed Installation Guide - Zabbix + MikroTik SNMP Monitoring

## 1. Prepare the MikroTik Router
- Access your MikroTik via Winbox, WebFig, or terminal (SSH/Telnet)
- Upload and import the SNMP configuration snippet from the repo:  
  `/import file=enable-snmp-basic.rsc`  
  (file located in `config/mikrotik/` – adjust the community string and Zabbix server IP before importing!)
- Verify the configuration:  
  `/snmp print`  
  `/snmp community print`
- Make sure the router allows SNMP traffic from your Zabbix server's IP

## 2. Zabbix Server Setup (if not already done)
- Install Zabbix 7.0 on Ubuntu Server (recommended)  
  Follow the official guide: https://www.zabbix.com/download?zabbix=7.0&os_distribution=ubuntu&os_version=22.04&db=mysql&ws=nginx
- Ensure proper DNS resolution (critical for Telegram API calls)  
  Edit `/etc/netplan/` config if needed and apply: `sudo netplan apply`

## 3. Import Templates into Zabbix
- Go to: **Configuration → Templates → Import**
- Select files from `config/zabbix/`:
  - `zabbix_mikrotik_template.xml` (your custom MikroTik SNMP template)
  - `Template Module ICMP Ping.xml` (official fallback for basic reachability checks)
- Optional: If you prefer the official YAML version, import `template_net_mikrotik_snmp.yaml` too

## 4. Add the MikroTik Host in Zabbix
- **Configuration → Hosts → Create host**
- Host name: e.g. `MikroTik-Router`
- Groups: Add to "Network devices" or create one
- Interfaces: Add **SNMP** interface  
  - IP: your MikroTik router IP  
  - Port: 161  
  - SNMP version: 2c  
  - Community: the one you set in `enable-snmp-basic.rsc` (e.g. `MaCommunauteSecurisee123`)
- Templates: Link  
  - Your imported MikroTik SNMP template  
  - Template Module ICMP Ping (for basic up/down detection)
- Save and wait ~5–10 min for first data collection

## 5. Set Up Telegram Notifications
- Create a Telegram Bot via @BotFather → get the **Bot Token**
- Get your **Chat ID** (send a message to your bot and use https://api.telegram.org/bot<token>/getUpdates)
- In Zabbix: **Administration → Media types → Create media type**
  - Name: Telegram  
  - Type: Webhook or Script  
  - Configure parameters (token, chat_id, message format – see Zabbix docs or community examples)
- Create or edit a User and assign the Telegram media type
- **Configuration → Actions → Create action**
  - Conditions: Trigger severity ≥ High (or your preference)  
  - Operations: Send message via Telegram to your user/group
- Test the action (you can trigger a fake problem by temporarily disabling SNMP on the router)

See the main README for architecture overview, screenshots, and quick config steps.

Happy monitoring!
