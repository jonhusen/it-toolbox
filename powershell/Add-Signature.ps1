## Signs a file
param([string] $file=$(throw "Please specify a filename."))
$cert = @(Get-ChildItem cert:\CurrentUser\My -CodeSigningCert)[0]
Set-AuthenticodeSignature $file $cert
