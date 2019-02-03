Add-PSSnapin "Microsoft.SharePoint.PowerShell"
Get-SPLogEvent -StartTime 3:48 -EndTime 3:50 |Select message | Export-Csv D:\logevents\log.csv