[system.reflection.assembly]::LoadWithPartialName("Microsoft.SharePoint")
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$siteUrl="http://99sp6/sites/JobReq2"
$site=new-object Microsoft.SharePoint.SPSite($siteUrl)
$web=$site.OpenWeb()
$web.url
$i=0


$listTask=$web.Lists["Tasks"]
$Taskitems = $listTask.Items| Where-Object{$_["ReqNumber"] -eq "4643"}

foreach( $Task in $Taskitems | where {$_[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion] -ne 1}){
Try{

  Write-Host Unlocking workflow on $Task.name
  $Task[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion]=1
 $Task.SystemUpdate()
 #$Task.Update()

 }
 Catch [ System.Exception]{
 
 
 Write-Host Caught error trying to unlock workflow -ForegroundColor Red
 
 
 }

}