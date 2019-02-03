cls
[system.reflection.assembly]::LoadWithPartialName("Microsoft.SharePoint")
$siteUrl="http://99sp6/sites/jobreq2/"
$site=new-object Microsoft.SharePoint.SPSite($siteUrl)
$web=$site.OpenWeb()
$web.url
$i=0

$list=$web.Lists.TryGetList("Tasks")


    foreach($item in $list.items | where {$_[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion] -ne 1}){
     {
             Write-Host Unlocking workflow on $item["ReqNumber"]
            
            if($item["Status"] -eq "Not Started")
            {
                  Try
                  {
                        Write-Host Unlocking workflow on $item["ReqNumber"]
                       # $item[[Microsoft.SharePoint.SPBuiltInFieldId]::WorkFlowVersion]=1;                
                        #$item.SystemUpdate()
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