cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
Get-ADUser -Filter "*" | Where-Object {$_.Name -match "spuser1"}