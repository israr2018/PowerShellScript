#system.reflection.assembly]::LoadWithPartialName("Microsoft.SharePoint")
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


write-host $web.lists
foreach($list in $web.lists){
    foreach($item in $list.items | where {$_[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion] -ne 1}){
    
            if($item["Status"] -eq "Not Started")
            {
                  Try
                  {
                        Write-Host Unlocking workflow on $item.name
                        $item[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion]=1;               
                        $item.SystemUpdate()
                        $i++
                  }
                  Catch [System.Exception]
                  {
                        Write-Host Caught error trying to unlock workflow -ForegroundColor Red
                  }
            }        
      }
}
Write-Host Unlocked $i workflows within $web.url
$web.dispose()
$site.dispose()
2 of 2 people found this helpful
