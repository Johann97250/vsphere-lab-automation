<#
.SYNOPSIS
    Script de simulation Disaster Recovery (DR) pour le Lab vSphere.
    Migre une VM critique du site de Production (ESXi-01) vers le site de Replica (ESXi-02).
#>

param (
    [string]$VMName = "Workload-Prod-01",
    [string]$SourceHost = "192.168.1.200",
    [string]$DestHost = "192.168.1.201",
    [string]$vCenter = "192.168.1.199"
)

Write-Host "--- 🚨 DÉBUT DE LA PROCÉDURE DE BASCULE (DR) ---" -ForegroundColor Cyan

# 1. Connexion au vCenter
# Dans un vrai script, on utiliserait des variables sécurisées
Write-Host "[1/3] Connexion au vCenter $vCenter..."
# Connect-VIServer -Server $vCenter -User "administrator@vsphere.local" -Password "TonMotDePasse"

# 2. Vérification de l'état de la VM
Write-Host "[2/3] Vérification de la VM $VMName sur $SourceHost..."
# $vm = Get-VM -Name $VMName

# 3. Migration (vMotion)
Write-Host "[3/3] Migration à chaud vers $DestHost en cours..." -ForegroundColor Yellow
# Move-VM -VM $vm -Destination $DestHost -Confirm:$false

Write-Host "--- ✅ BASCULE TERMINÉE AVEC SUCCÈS ---" -ForegroundColor Green
Write-Host "La VM $VMName est désormais protégée sur l'hôte $DestHost."
