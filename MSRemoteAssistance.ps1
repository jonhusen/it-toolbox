<# Microsoft Remote Assistance
Launches Remote Assistance on the remote computer.
Connects in View mode.
Guest must request control.
#>

$RemoteComputer = Read-Host -Prompt "Name of remote computer"
msra.exe /offerRA $RemoteComputer
