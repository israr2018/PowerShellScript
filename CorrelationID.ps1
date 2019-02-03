Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$CorrelationId="db82b39d-ff03-403b-cdbf-fa87c71bf7e4"
Get-SPLogEvent -StartTime (Get-Date).AddMinutes(-2) | ?{$_.Correlation -eq $CorrelationId}|select Area, Category, Level, EventID, Message | Format-List 



