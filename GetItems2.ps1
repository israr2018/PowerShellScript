cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$site= Get-SPSite -Identity http://99sp6/sites/jobreq2
$web= $site.RootWeb
$listJobReq=$web.Lists["Job Requisition Form"]
$listTask=$web.Lists["Tasks"]
$items=$listTask.GetItems()|Where-Object{$_['Title'] -match ("Job.* ")}

$count=1
foreach($item in $items){


Write-Host( "count=$count Task Title "+$item.Title)
$count=$count+1

}