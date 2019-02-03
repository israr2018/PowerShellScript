cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$site= Get-SPSite -Identity http://99sp6/sites/jobreq2
$web= $site.RootWeb
$listJobReq=$web.Lists["Job Requisition Form"]

$listTask=$web.Lists["Tasks"]
if($listJobReq -eq $null){


Write-Host("Task list is null")

}

$JobReqItems= $listJobReq.Items
$TaskItems=$listTask.Items|Where-Object{$_['Title'] -match ("Job.* ")}
Write-Host "Updating JobReqNumber  in Task List...wait please" -BackgroundColor DarkMagenta
foreach($JobReq in $JobReqItems){

$Name=$JobReq.Name
$ID=$JobReq.ID
$Name2=$Name.Trim()
foreach($Task in $TaskItems){


$title= $Task.Title

$title2=$title -replace ("Job.*\s+on","")
$title3=$title2.Trim()



if($Name2 -eq $title3){

Write-Host "we hava matche" -BackgroundColor DarkRed
if($Task["JobReqNumber"] -ne $null){
$Task["JobReqNumber"]=$ID
$Task.Update()

}
}


}





}


Write-Host "Task list has been updated with JobReqNumber column"  -BackgroundColor DarkMagenta







