
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$site= Get-SPSite "http://99sp6/sites/appraisals"
$web=$site.RootWeb
$groups=$web.SiteGroups
foreach( $g in $groups){

foreach( $user in  $g.users|Where-Object{$_.Name -eq "spuser1"}){


Write-Host ($g.Name)

}




}