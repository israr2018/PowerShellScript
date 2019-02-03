$web = Get-SPWeb -Identity http://99sp6/sites/appraisals
$list = $web.Lists[“Manager Appraisals”]


$list.EventReceivers
$list.EventReceivers | Out-File -filepath "D:\EventReceivers.txt"
