cls
#system.reflection.assembly]::LoadWithPartialName("Microsoft.SharePoint")
$siteUrl="http://99sp6/sites/JobReq2"
$site=new-object Microsoft.SharePoint.SPSite($siteUrl)
$web=$site.OpenWeb()
$web.url
$i=0


$listTask=$web.Lists["Tasks"]
#$Taskitems = $listTask.Items| Where-Object{$_["ID"] -eq "14155"}

$Taskitems = $listTask.Items


foreach( $Task in $Taskitems | where {$_[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion] -ne 1}){
Write-Host Unlocking workflow on $Task.name

Try{

  Write-Host Unlocking workflow on $item["ReqNumber"]
 $Task[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion]=1
 $Task.SystemUpdate()

 }
 Catch [ System.Exception]{
 
 
 Write-Host Caught error trying to unlock workflow -ForegroundColor Red
 
 
 }

}