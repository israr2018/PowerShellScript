Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue
 
$CorruptedSiteURL ="http://99sp6/sites/test"
 
#Get the site collection
$site = Get-SPSite $CorruptedSiteURL
 
#Get the GUID of the site collection
$siteGUID = $site.Id
Write-host "Site collection GUID:"$siteGUID
 
#Get the content Database of the Site collection
$siteDatabase = $site.ContentDatabase
 
#Force delete the site collection
$siteDatabase.ForceDeleteSite($siteGUID, $false, $false)


