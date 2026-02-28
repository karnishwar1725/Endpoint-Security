# Endpoint Security with AI-Driven Automated Remediation

## Project Overview

This project demonstrates a centralized endpoint security monitoring and automated remediation lab deployed in Microsoft Azure.

The lab consists of:

- Windows Endpoint
- Ubuntu Linux Endpoint
- Wazuh SIEM Manager
- OpenSearch Dashboard
- AI Automation Layer (FastAPI + TinyLlama via Ollama)

The objective is to simulate endpoint attacks, detect them using custom Wazuh rules mapped to MITRE ATT&CK techniques, and trigger automated remediation using an AI classification engine.

---

## Architecture

Windows/Linux Endpoints → Wazuh Agent → Wazuh Manager → Webhook → Ollama (TinyLlama) → Wazuh Active Response

---

## Technologies Used

- Microsoft Azure
- Wazuh SIEM
- OpenSearch
- Docker & Docker Compose
- FastAPI
- Ollama (TinyLlama)
- Sysmon (Windows)
- auditd (Linux)

---

## Implemented Attack Scenarios

### Windows
- Brute Force Login (Event ID 4625)
- Encoded PowerShell Execution
- Suspicious Process Execution

### Linux
- Simulated Privilege Escalation Activity
- Unauthorized User Creation
- SSH Brute Force Attempt

---

## Automated Remediation Implemented

- Windows account locking
- PowerShell process termination
- Linux account locking (privilege escalation scenario)

---

## Reproducibility

### 1. Start Wazuh Manager
sudo systemctl start wazuh-manager

### 2. Start AI Automation Stack
docker compose up -d

### 3. Windows Brute Force Simulation
PowerShell:
for ($i=1; $i -le 5; $i++) { net use \\localhost\IPC$ /user:redteamuser WrongPass }

### 4. Encoded PowerShell Simulation
powershell -EncodedCommand <base64>

### 5. Linux Privilege Escalation Simulation
logger "Privilege escalation attempt detected"

---

## MITRE ATT&CK Mapping

| Platform | Attack | Technique |
|----------|--------|----------|
| Windows | Brute Force | T1110 |
| Windows | Encoded PowerShell | T1059 |
| Linux | Privilege Escalation | T1548 |
| Linux | User Creation | T1136 |

---

## AI Usage

TinyLlama was integrated as a local AI engine using Ollama to classify high-severity alerts and determine remediation actions.

AI tools were also used during development for troubleshooting configuration errors and understanding detection logic.

---

All attacks were simulated in a controlled Azure lab environment for educational purposes only.
