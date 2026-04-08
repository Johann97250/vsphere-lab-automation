# 🚀 vSphere Lab Automation & Disaster Recovery

[![Terraform](https://img.shields.io/badge/Terraform-1.5+-623CE4.svg?style=for-the-badge&logo=terraform)](https://www.terraform.io/)
[![Ansible](https://img.shields.io/badge/Ansible-2.14+-EE0000.svg?style=for-the-badge&logo=ansible)](https://www.ansible.com/)
[![VMware](https://img.shields.io/badge/VMware-vSphere_8.0-607078.svg?style=for-the-badge&logo=vmware)](https://www.vmware.com/)

## 📖 Présentation du Projet
Ce projet automatise le déploiement complet d'un environnement **SDDC (Software-Defined Data Center)** VMware. L'objectif est de simuler une infrastructure d'entreprise incluant la haute disponibilité et la reprise d'activité.

L'infrastructure déploie dynamiquement :
*   **1 vCenter Server Appliance (VCSA)** pour la gestion centralisée.
*   **2 Hôtes ESXi (Nested)** : Un nœud de **Production** et un nœud de **Replica**.
*   **Stockage vSAN** : Configuration d'un cluster de stockage hyperconvergé.
*   **Networking** : vSwitches dédiés pour les flux Management, vMotion et vSAN.

## 🏗️ Architecture Technique
L'infrastructure est segmentée en plusieurs couches automatisées :

1.  **Provisioning (Terraform)** : Déploiement des machines virtuelles ESXi et vCenter.
2.  **Configuration (Ansible)** : Configuration post-installation du cluster, activation du vSAN et création des réseaux virtuels.
3.  **DR Scenario (PowerCLI)** : Script de basculement (Failover) automatisé des charges de travail du nœud de production vers le replica.

---

## 📂 Structure du Dépôt
```text
.
├── terraform/          # Code IaC pour le déploiement des VMs hôtes
├── ansible/            # Playbooks de configuration vCenter/Cluster
├── scripts/            # Scripts PowerCLI pour la migration (Vmotion/Replica)
├── docs/               # Schémas réseaux et diagrammes d'architecture
└── README.md
```
##De façon plus détaillée
```text
.
├── ansible
│   ├── playbooks
│   └── roles
│       └── vsphere_config
│           └── tasks
├── docs
├── scripts
└── terraform
    └── modules
```
---

## 🛠️ Installation & Utilisation

### 1. Prérequis
* Un hyperviseur physique ou VMware Workstation.
* Accès réseau aux ISO VMware (VCSA, ESXi).
* Terraform & Ansible installés sur votre machine de contrôle (WSL2 recommandé).

### 2. Déploiement de l'Infrastructure
```bash
Se déplacer dans le dossier Terraform
cd terraform/
terraform init
terraform apply -var-file="secrets.tfvars"
```
### 3. Configuration du Cluster
```bash
Se déplacer dans le dossier Ansible
cd ../ansible/

Lancer la configuration du vCenter, du vSAN et du réseau
ansible-playbook -i inventory.yml playbooks/setup-cluster.yml
```
### 4. Simulation de Migration
```powershell
Commande type pour migrer une VM entre les deux hôtes
./scripts/migrate-vm.ps1 -VMName "Workload-Prod-01" -SourceHost "ESXi-01" -DestHost "ESXi-02"
```
---

## 🎯 Objectifs de Démonstration
Automatisation Totale : Réduction du temps de déploiement de 4h (manuel) à 15min (automatisé).

Sécurisation des flux : Isolation réseau via Port Groups (vMotion, vSAN, Management).

Résilience : Preuve de concept (PoC) sur la migration de VM sans interruption de service.

---
Développé par Johann GOBALSAMY Passionné par l'automatisation Cloud & l'ingénierie DevOps.
