Import-Module VMware.PowerCLI

$cred = Get-Credential
Connect-VIServer -Server srvr-vcenter.spectrumeng.local -Credential $cred

# Set variables for each host and VM's on each host as $hostXX and $hostXXvms
$vmHosts = Get-VMHost -Server srvr-vcenter.spectrumeng.local
foreach ($item in $vmHosts) {
    Set-Variable -Name (($item.Name.Split("-")[1]).Split(".")[0]) -Value $item
    Set-Variable -Name (($item.Name.Split("-")[1]).Split(".")[0] + "vms") -Value $($item | get-vm)
}

Set-VMHost -VMHost $host11 -State Maintenance -Force
Start-Sleep -Seconds 10
Restart-VMHost -VMHost $host11 -Force
Start-Sleep -Seconds 30
while ($(Get-VMHost -Name $host11).PowerState - "Unknown") {
    Write-host "Waiting for host to power on"
    Start-Sleep -Seconds 60
}

Set-VMHost -VMHost $host11 -State Connected


#$host11 | Get-VM | Move-VM -Destination $host12

Get-Folder -Name "Test VMs" | Get-VM | Stop-VMGuest