Add-PSSnapin "Microsoft.SharePoint.PowerShell"
Restore-SPSite -Identity "http://99sp6/sites/appraisals" -Path 'D:\Backup_Israr\appraisals.bak' -Force