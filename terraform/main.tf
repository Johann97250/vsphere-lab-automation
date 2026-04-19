# Configuration des ressources (CPU, RAM, Réseau)
# Note : Ces ressources seront activées quand ton hyperviseur sera prêt
resource "vsphere_virtual_machine" "esxi_nodes" {
  count            = 2
  name             = "ESXi-Host-0${count.index + 1}"
  num_cpus         = 2
  memory           = 3072 # 3Go de RAM par hôte
  guest_id         = "vmkernel7Guest"

  network_interface {
    network_id = "VM Network" # Nom par défaut dans VMware
  }

  disk {
    label = "disk0"
    size  = 50 # 50Go pour l'installation d'ESXi
  }
}
