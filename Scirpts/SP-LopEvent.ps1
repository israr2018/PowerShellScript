Add-PSSnapin "Microsoft.SharePoint.PowerShell"
Get-SPLogEvent -StartTime "11:28" -EndTime "11:31" | Select message | Export-Csv -LiteralPath D:\LogEvents\log.csv