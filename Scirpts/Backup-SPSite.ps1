Add-PSSnapin "Microsoft.SharePoint.PowerShell"


Backup-SPSite -Identity "http://99sp6/sites/appraisals" -Path D:\Backup\99sp6appraisals.bak

