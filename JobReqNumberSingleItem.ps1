cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$site= Get-SPSite -Identity http://99sp6/sites/jobreq2
$web= $site.RootWeb
$listTask=$web.Lists.TryGetList("Job Requisition Form")
$Taskitems = $listTask.Items| Where-Object{$_["Approval"] -eq "In Progress"}




foreach( $Task in $Taskitems){
Write-Host task name  ($Task.name)
$Task["Status"]="In Progress"
#$Task["JobReqNumber"]="999"
$Task.SystemUpdate()


}

