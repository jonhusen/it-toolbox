<# Reads a .cred file containing an encrypted password

Reads the encrypted password from the .cred file and creates a credential object

#>

$CredentialFolder = "C:\support\"
$CredentialUsername = Read-Host "Username"
$SecurePW = Get-Content -Path
