$site = Get-SPSite http://99sp6/sites/appraisals
$web = $site.OpenWeb()
$list = $web.Lists["Manager Appraisals"]
$list.EventReceivers|select Name,Assembly,Type | Out-File -filepath "D:\isar.txt" 
