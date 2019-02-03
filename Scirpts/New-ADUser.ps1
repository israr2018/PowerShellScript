cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
New-ADUser -Name "SPIsrar1" -GivenName "SPIsrar1" -SamAccountName "SPIsrar1" -UserPrincipalName "spisrar1@ADMIN.99sp6.LOCAL" -AccountPassword (Read-Host -AsSecureString "AccountPassword")-PassThru | Enable-ADAccount