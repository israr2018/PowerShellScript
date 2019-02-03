cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
Get-SPSolution |Where-Object {$_.Name -match ("Emp.*")}