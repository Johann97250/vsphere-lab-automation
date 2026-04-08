# 🌐 Architecture Réseau du Lab vSphere

Pour simuler un environnement professionnel, le lab utilise trois réseaux logiques (VLANs/Port Groups).

## 📊 Plan d'adressage IP
| Équipement       | Interface       | Adresse IP      | Rôle                         |
|------------------|-----------------|-----------------|------------------------------|
| **vCenter** | Management      | 192.168.1.199   | Gestion centralisée          |
| **ESXi-01** | Management      | 192.168.1.200   | Administration de l'hôte 1   |
| **ESXi-01** | vMotion         | 10.0.10.200     | Migration de VM (Privé)      |
| **ESXi-01** | vSAN            | 10.0.20.200     | Stockage partagé (Privé)     |
| **ESXi-02** | Management      | 192.168.1.201   | Administration de l'hôte 2   |
| **ESXi-02** | vMotion         | 10.0.10.201     | Migration de VM (Privé)      |
| **ESXi-02** | vSAN            | 10.0.20.201     | Stockage partagé (Privé)     |

## 🔌 Configuration des VSwitches
L'automatisation Ansible va créer les éléments suivants :
1. **vSwitch0** : Réseau de Management (Accès internet et interface vCenter).
2. **vSwitch1** : Réseau vMotion (Dédié au script de migration PowerCLI).
3. **vSwitch2** : Réseau vSAN (Dédié à la réplication des données entre disques).
