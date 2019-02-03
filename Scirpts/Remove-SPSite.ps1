Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$siteCol=Get-SPSite -Identity "http://99sp6/sites/appraisals"
If( $siteCol -ne $null){

Write-Host ("Removing the site Collection:"+$siteCol)
Remove-SPSite $siteCol

Write-Host( "The Site Collection:"+$siteCol + "    has been removed")
}
else{

Write-Host( "The Site Collection:"+$siteCol + "   could not found.")


}