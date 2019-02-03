Add-PSSnapin "Microsoft.SharePoint.PowerShell"

$Site= Get-SPSite -Identity http://99sp6/sites/appraisals
$Web=$Site.RootWeb
$List= $Web.Lists["List"]
$List.EventReceivers | Select ID,Name,Assembly,Type,Order|FL