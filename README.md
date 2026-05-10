# 📡 Monitoring a MikroTik Router via SNMP with Zabbix

[![CI](https://github.com/Tsila47/zabbix-mikrotik-monitoring/actions/workflows/ci.yml/badge.svg)](https://github.com/Tsila47/zabbix-mikrotik-monitoring/actions/workflows/ci.yml)
## 📌 Project Description

This project demonstrates a complete network monitoring setup for a MikroTik router using the SNMP protocol with Zabbix.

The main goals are:

- Monitor the router's health/status
- Track CPU, RAM, and interface traffic
- Receive automatic alerts via Telegram
- Build a professional-grade configuration suitable for a real-world environment

---

## 🏗 Project Architecture

- Router: MikroTik RouterOS
- Monitoring server: Zabbix Server 7.0
- Protocol used: SNMP v2c
- Operating system: Ubuntu Server (VM)
- Notifications: Telegram Bot

Data flow:

MikroTik → SNMP → Zabbix Server → Trigger → Action → Telegram Bot

---

## ⚙️ Technologies Used

- Zabbix 7.0
- SNMP v2c
- MikroTik RouterOS
- Ubuntu Server
- Telegram Bot API
- Netplan (network configuration)

---

## 🔧 Configuration Steps

### 1️⃣ Enable and configure SNMP on MikroTik

- Enable the SNMP service
- Set up the SNMP community string
- Allow the Zabbix server's IP address

### 2️⃣ Add the router to Zabbix

- Create a new host
- Add an SNMP interface
- Link the appropriate template:
  - **Template Net MikroTik SNMP** (or **Mikrotik by SNMP** official template)

### 3️⃣ Create Triggers

Examples:

- SNMP communication lost
- CPU usage > 80%
- Interface Down

### 4️⃣ Set up Telegram alerts

- Create a bot using BotFather
- Retrieve the bot token
- Configure the Telegram Media Type in Zabbix
- Create an Action
- Test it (e.g. by stopping a service)

---

## 🚨 Example Alert Received

**PROBLEM:** MikroTik is unreachable  
**Host:** MikroTik-Router  
**Severity:** High  

---

## 🧠 Issues Encountered

- DNS resolution failure on the VM (could not reach api.telegram.org)
- "cannot get URL" error
- Action not being triggered
- Zabbix agent not available (misunderstanding – not needed for SNMP)

Solutions applied:

- Proper DNS configuration via Netplan
- Double-checking Actions configuration
- Correct Media Type setup
- User permission verification

---

## 📊 Results Achieved

- Fully functional SNMP monitoring
- CPU / RAM / Traffic graphs
- Automatic outage detection
- Real-time Telegram notifications

---

## 🚀 Future Improvements

- WAN bandwidth monitoring
- Custom dashboard
- Multi-router monitoring
- Grafana integration
- Export metrics to Prometheus

---

## 👨‍💻 Author

Randriamahazaka Tsilavina  
Student in Electronics, Computer Science and Technology  
Passionate about Networking, DevOps and Monitoring
