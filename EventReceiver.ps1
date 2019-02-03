$site = Get-SPSite http://99sp6/sites/appraisals
$web = $site.OpenWeb()
$list = $web.Lists["List"]
$list.EventReceivers | Select Name, Assembly, Type
