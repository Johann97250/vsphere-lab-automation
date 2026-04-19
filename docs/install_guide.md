# 🛠️ Guide d'installation physique (VMware Workstation)

Ce document décrit la configuration nécessaire sur l'hôte Windows pour supporter l'automatisation.

## 1. Prérequis Matériels
* **RAM :** 16 Go  (ESXi: 3Go x2 + vCenter: 8Go).
* **CPU :** Processeur supportant VT-x / AMD-V.
* **Stockage :** SSD de 256 Go dédié au lab.

## 2. Configuration de VMware Workstation
### Réseaux Virtuels (Virtual Network Editor)
Il est crucial de configurer les VMnets suivants pour correspondre au code :

| Nom VMnet | Type | Sous-réseau | Rôle |
| :--- | :--- | :--- | :--- |
| **VMnet0** | Bridged | Réseau local (Box) | Management & Accès Internet |
| **VMnet1** | Host-Only | 10.0.10.0/24 | Flux vMotion (Privé) |
| **VMnet2** | Host-Only | 10.0.20.0/24 | Flux vSAN (Privé) |

### Paramètres des VMs ESXi (Nested)
Pour que les ESXi puissent faire tourner d'autres VMs à l'intérieur, cochez :
* **Processors** > Virtualize Intel VT-x/EPT or AMD-V/RVI.
* **Processors** > Virtualize CPU performance counters.

## 3. Ordre de déploiement
1. **Installation manuelle du vCenter** : Déployer l'appliance VCSA sur VMware Workstation (IP `.199`).
2. **Lancement de Terraform** : Création des deux VMs ESXi vides (IP `.200` et `.201`).
3. **Lancement d'Ansible** : Configuration réseau interne des ESXi.

