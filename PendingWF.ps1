cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$site= Get-SPSite -Identity http://99sp6/sites/jobreq2
$web= $site.RootWeb
$listTask=$web.Lists.TryGetList("Job Requisition Form")

#$Taskitems = $listTask.Items

$Taskitems = $listTask.Items| Where-Object{$_["Approval"] -eq "InProgress" -and $Task["JobWorkf"]-eq "5" }





foreach( $Task in $Taskitems){
if($Task["JobWorkf"] -eq "5"){

Write-Host ($Task["Approval"]) ($Task["JobWorkf"]) Campus:($Task["Campus"])|Export-Csv -Path D:\LogEvents\result.csv 

}


}