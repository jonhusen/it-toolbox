<#
Migrate portgroups from standard vswitch to distributed vswitch
#>

$Credential = Get-Credential
$VCenter = Read-Host -Prompt "vCenter Server"
$EsxiHost = Read-Host -Prompt "ESXi Host name or ip address"

Connect-VIServer -Server $VCenter -Credential $Credential

Get-VirtualSwitch -VMHost $EsxiHost -Server $VCenter -Standard
$VSwitch = Read-Host -Prompt "Which vSwitch would you like to migrate to your vDS?"


$portgroups = Get-VirtualPortGroup -VirtualSwitch vSwitch0 -VMHost 10.0.10.11 -Standard


foreach ($pg in $portgroups) {
    New-VDPortgroup -VDSwitch "Lab vDS" -Name $pg.Name -VlanId $pg.VLanId
}
