cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$siteUrl="http://99sp6/sites/appraisals"
$site=New-Object Microsoft.SharePoint.SPSite ($siteUrl)
$web= $site.OpenWeb()

$list=$web.Lists["Manager Appraisals"]
$_324e7992_5114_48bd_bcb4_a84b214638dc

$list.Items | Format-Table name









$items =$list.Items

foreach( $item1 in $items){

Write-Host $item1.Fields["Employee Name"].InternalName
}


