﻿#system.reflection.assembly]::LoadWithPartialName("Microsoft.SharePoint")
$siteUrl="https://99sp6/sites/JobReq2"
$site=new-object Microsoft.SharePoint.SPSite($siteUrl)
$web=$site.OpenWeb()
$web.url
$i=0


$listTask=$web.Lists["Tasks"]
$Taskitems = $listTask.Items

foreach( $Task in $Taskitems | where {$_[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion] -ne 1}){
Try{

  Write-Host Unlocking workflow on $item.name
 $Task[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion]=1
 $Task.SystemUpdate()

 }
 Catch [ System.Exception]{
 
 
 Write-Host Caught error trying to unlock workflow -ForegroundColor Red
 
 
 }

}



