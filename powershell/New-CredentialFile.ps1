<# Create encrypted password as .cred file.

Prompts for user name and password then saves the encrypted password as
domain_username.cred

Encryption is done by Windows Data Protection API and is unique to the user
and host.

Caveats:
The file cannot be used by another user or moved to another computer.
If using a service account, the account must be granted "log on locally"
temporarily for the initial creation of the file.
The GPO for "Network Access: Do not allow storage of passwords and credentials
for network authentication" must be set to Disabled or not configured.
Otherwise, the encryption keys only last for the duration of the user session.

#>

$Credential = Get-Credential -Message "Enter user name as 'domain\user'"
$UsernameSplit = $credential.UserName.Split("\")
$FileName = $UsernameSplit[0] + "_" + $UsernameSplit[1] + ".cred"
$SecurePW = ConvertFrom-SecureString -SecureString $Credential.Password
$PWFolderPath = "C:\support\"

New-Item -Path $PWFolderPath -Name $FileName -ItemType File -Value $SecurePW -Force
