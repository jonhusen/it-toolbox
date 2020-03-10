#O365 connection script

#O365 Credentials
$O365Cred = Get-Credential

#Create connection to Exchange Online organization
$Args = @{
    ConfigurationName = "Microsoft.Exchange"
    ConnectionUri     = "https://outlook.office365.com/powershell-liveid/"
    Credential        = $O365Cred
    Authentication    = "Basic"
}

$Session = New-PSSession @Args -AllowRedirection

#Load Exchange cmdlets on local computer

Import-PSSession $Session -DisableNameChecking

# Close the connection
Remove-PSSession $Session

# If account is using MFA, you must run this command in the Exchange Online Powershell module
Connect-EXOPSSession -UserPrincipalName $O365Cred.UserName
